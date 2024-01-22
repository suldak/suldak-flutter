library suldak_api;

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../config/keys.dart';
import '../utils/toast.dart';

part './api_interceptor.dart';

/// ## 서버 예외 상황에 대한 콜백
/// 모든 API의 응답 결과는 result 코드 및 message 를 포함한다. 이때 result가 1이 아닌 경우,
/// 서버에서 예외 처리가 진행되었음을 의미한다.
///
/// 이 경우 개별 repo 에서 콜백을 통해 예외처리를 진행한다.
typedef OnServerException = void Function(String? msg, int? code);

mixin API on GetxService {
  /// ## 모든 통신에서 기초가 되는 [Dio] instance
  static final _dio = Dio();

  /// ## 초기화 여부
  /// 최초 앱을 시작하면, config file 을 통해서 baseurl 및 필수 업데이트 버전을 확인한다.
  /// config file을 받고, baseurl 설정이 완료되면 [complete] 함수를 호출한다.
  static final _isInitialized = Completer<bool>();

  /// 로그에 사용되는 각 api service의 이름.
  String get apiName;

  /// 초기화 함수.
  static Future<void> initialize(String baseUrl) async {
    _dio.options = BaseOptions(
      contentType: Headers.jsonContentType,
      baseUrl: baseUrl,
    );
    _dio.interceptors
      ..clear()
      ..add(_DioInterceptor());
    _isInitialized.complete(true);
  }

  /// ### 모든 리소스를 해제하고 모든 연결을 종료.
  /// [force]가 [true]인 경우, 현제 살아있는 모든 커넥션을 강제로 끊어낸다.
  @nonVirtual
  void dispose({bool force = false}) {
    _dio.close(force: force);
    _dio.interceptors.clear();
  }

  /// 파라미터를 콘솔에 출력
  @protected
  void debugPrintParams(String endPoint, Map? params) {
    if (kDebugMode && params != null) {
      log('👀 ------- $endPoint ------- 👀', name: apiName);
      params.forEach((k, v) {
        if (v is MultipartFile) {
          log('✓ $k: ${v.filename}', name: apiName);
        } else {
          log('✓ $k: $v', name: apiName);
        }
      });
      log('------------------------------', name: apiName);
    }
  }

  /// ### 네트워크의 왕복 소요시간을 로그에 표시한다.
  /// 디버깅 모드에서만 동작하며, 시작시 콜 시작시에
  void _logTurnaroundTime(String path, DateTime? start) {
    if (start == null) {
      return;
    }
    log(
      '⏱ PATH: $path, 소요시간: ${DateTime.now().difference(start).inMilliseconds}ms',
      name: apiName,
    );
  }

  /// ### [Dio().get]의 wrapper
  /// get 의 데이터는 모두 [data]로 전달한다
  ///   소요시간을 확인하기 위해서는 [checkDuration]을 [true]로 하면 콘솔에 소요시간을 표시한다.
  ///
  /// 또한 [printQuery]에 [true]를 전달하면, 쿼리로 전달되는 데이터를 log에 표시한다.
  @nonVirtual
  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? data,
    bool checkDuration = false,
    bool printQuery = kDebugMode,
  }) async {
    if (!_isInitialized.isCompleted) {
      await _isInitialized.future;
    }

    // null인 값 제거
    data?.removeWhere((k, v) => v == null);

    // 디버깅용 세팅
    DateTime? startTime;
    if (kDebugMode) {
      startTime = checkDuration ? DateTime.now() : null;
      if (printQuery) {
        debugPrintParams(path, data);
      }
    }

    final Map<String, dynamic> header = {
      'Content-Type': 'Application/json',
    };

    // user token 추가
    final token = GetStorage().read<String>(Keys.refreshToken);
    if (token != null) {
      header['Authorization'] = token;
      log('🔑 유저 토큰을 함께 전송합니다. end point: $path', name: apiName);
    }

    final res = _dio.get<Map<String, dynamic>>(
      path,
      queryParameters: data,
      options: Options(
        headers: header,
      ),
    );
    _logTurnaroundTime(path, startTime);
    return res;
  }

  /// ### [Dio().post]의 wrapper
  /// post 의 데이터는 모두 [data]로 전달허고, 동시에 get 방식으로 데이터를 전달하는 부분은
  /// [queries]에 [Map]으로 전달하여 사용할 수 있다. 소요시간을 확인하기 위해서는
  /// [checkDuration]을 [true]로 하면 콘솔에 소요시간을 표시한다.
  ///
  /// 이미지나 파일을 [FormData]를 통해서 전송하는 경우 [isFormData]에 [true]를 전달하면
  /// [data]를 기반으로 [FormData]를 생성하여 전달한다.
  /// 이때 이미지 및 파일을 [MultipartFile]로 전달해야 한다.
  ///
  /// 또한 [printQuery]에 [true]를 전달하면, 쿼리로 전달되는 데이터를 log에 표시한다.
  @nonVirtual
  Future<Response<Map<String, dynamic>>> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic> queries = const {},
    bool checkDuration = false,
    bool printQuery = kDebugMode,
  }) async {
    if (!_isInitialized.isCompleted) {
      await _isInitialized.future;
    }

    // null인 값 제거
    data?.removeWhere((k, v) => v == null);

    // 디버깅용 세팅
    DateTime? startTime;
    if (kDebugMode) {
      startTime = checkDuration ? DateTime.now() : null;
      if (printQuery) {
        debugPrintParams(path, data);
      }
    }

    // form data 안에 multi part file 있는지 확인해서 있으면 해더 변경
    bool hasMultiPartFile = false;
    data?.forEach((key, value) {
      if (value is MultipartFile) {
        hasMultiPartFile = true;
      }
    });

    final Map<String, dynamic> header = {};

    if (hasMultiPartFile) {
      header['Content-Type'] = 'multipart/form-data';
    } else {
      header['Content-Type'] = 'Application/json';
    }

    // user token 추가
    final token = GetStorage().read<String>(Keys.refreshToken);
    if (token != null) {
      header['Authorization'] = token;
      log('🔑 유저 토큰을 함께 전송합니다. end point: $path', name: apiName);
    }



    return _dio.post<Map<String, dynamic>>(
      path,
      data: data != null
          ? hasMultiPartFile
              ? FormData.fromMap(data)
              : data
          : null,
      queryParameters: queries,
      options: Options(
        contentType:
            hasMultiPartFile ? 'multipart/form-data' : 'Application/json',
        headers: header,
      ),
    )..whenComplete(() {
        _logTurnaroundTime(path, startTime);
      });
  }

  /// ### [Dio().delete]의 wrapper
  /// delete 의 데이터는 모두 [data]로 전달한다
  ///   소요시간을 확인하기 위해서는 [checkDuration]을 [true]로 하면 콘솔에 소요시간을 표시한다.
  ///
  /// 또한 [printQuery]에 [true]를 전달하면, 쿼리로 전달되는 데이터를 log에 표시한다.
  @nonVirtual
  Future<Response<Map<String, dynamic>>> delete(
      String path, {
        Map<String, dynamic>? data,
        bool checkDuration = false,
        bool printQuery = kDebugMode,
      }) async {
    if (!_isInitialized.isCompleted) {
      await _isInitialized.future;
    }

    // null인 값 제거
    data?.removeWhere((k, v) => v == null);

    // 디버깅용 세팅
    DateTime? startTime;
    if (kDebugMode) {
      startTime = checkDuration ? DateTime.now() : null;
      if (printQuery) {
        debugPrintParams(path, data);
      }
    }

    final Map<String, dynamic> header = {
      'Content-Type': 'Application/json',
    };

    // user token 추가
    final token = GetStorage().read<String>(Keys.refreshToken);
    if (token != null) {
      header['Authorization'] = token;
      log('🔑 유저 토큰을 함께 전송합니다. end point: $path', name: apiName);
    }

    final res = _dio.delete<Map<String, dynamic>>(
      path,
      queryParameters: data,
      options: Options(
        headers: header,
      ),
    );
    _logTurnaroundTime(path, startTime);
    return res;
  }

  /// ### [Dio().put]의 wrapper
  /// put 의 데이터는 모두 [data]로 전달한다
  ///   소요시간을 확인하기 위해서는 [checkDuration]을 [true]로 하면 콘솔에 소요시간을 표시한다.
  ///
  /// 또한 [printQuery]에 [true]를 전달하면, 쿼리로 전달되는 데이터를 log에 표시한다.
  @nonVirtual
  Future<Response<Map<String, dynamic>>> put(
      String path, {
        Map<String, dynamic>? data,
        bool checkDuration = false,
        bool printQuery = kDebugMode,
      }) async {
    if (!_isInitialized.isCompleted) {
      await _isInitialized.future;
    }

    // null인 값 제거
    data?.removeWhere((k, v) => v == null);

    // 디버깅용 세팅
    DateTime? startTime;
    if (kDebugMode) {
      startTime = checkDuration ? DateTime.now() : null;
      if (printQuery) {
        debugPrintParams(path, data);
      }
    }

    final Map<String, dynamic> header = {
      'Content-Type': 'Application/json',
    };

    // user token 추가
    final token = GetStorage().read<String>(Keys.refreshToken);
    if (token != null) {
      header['Authorization'] = token;
      log('🔑 유저 토큰을 함께 전송합니다. end point: $path', name: apiName);
    }

    final res = _dio.put<Map<String, dynamic>>(
      path,
      queryParameters: data,
      options: Options(
        headers: header,
      ),
    );
    _logTurnaroundTime(path, startTime);
    return res;
  }
}

extension ResponseValidator on Response<Map> {
  /// ## 서버 예외 상황 여부 확인
  /// 모든 API의 응답 결과는 result 코드 및 message 를 포함한다. 이때 result가 1이 아닌 경우,
  /// 서버에서 예외 처리가 진행되었음을 의미한다.
  ///
  /// 만약 통신에는 문제가 없고, result 값이 1이 아닌 경우, [onServerException]을 실행시킨다.
  /// 아무런 문제가 없는 경우에만 response의 data를 반환한다.
  Map? validateData(OnServerException? onServerException, {bool showToast = true}) {
    if (statusCode == 200 && data != null) {
      if (data?['success']) {
        return data;
      }
    }

    if (onServerException != null) {
      onServerException.call(data?['message'], data?['errorCode']);
    } else {
      if (showToast) Toast.show(msg: data?['message'] ?? '');
    }

    return null;
  }
}
