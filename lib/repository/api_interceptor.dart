part of painterus_api;

class _DioInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data as Map?;
    if (data != null) {
      // 남은 정지 시간 기본값 0
      final suspendedTime = int.tryParse(data['seconds'] ?? '') ?? 0;
      // 탈퇴 후 재가입 가능 여부 기본값 null
      // 1은 재가입 불가, 0은 재가입 가능
      // null 은 탈퇴 안함...
      final ableToJoin = int.tryParse(data['done'] ?? '');

      if (suspendedTime > 0 || ableToJoin != null) {
        // TODO: 계정 복구 화면으로 이동
        handler.resolve(Response(
          requestOptions: response.requestOptions,
          statusCode: response.statusCode,
        ));
        return;
      }

      // result code에 따라 error interceptor 로 전달
      if (data['result'] != 1) {
        handler.reject(DioException(
          requestOptions: response.requestOptions,
          message: data['msg'],
          response: response,
          type: DioExceptionType.unknown,
          error: {
            'result': data['result'],
            'msg': data['msg'],
          },
        ));
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('‼️ API 에러 발생 ‼️', name: 'Error Interceptor');
    log('‼️ status code: ${err.response?.statusCode}', name: 'Error Interceptor');
    log('‼️ end ponint: ${err.requestOptions.path}', name: 'Error Interceptor');
    log('‼️ error message: ${err.message}', name: 'Error Interceptor');
    log(' ------------------------------------️', name: 'Error Interceptor');

    handler.resolve(Response(
      requestOptions: err.requestOptions,
      statusCode: err.response?.statusCode,
      data: err.error is Map ? err.error : null,
    ));
  }
}