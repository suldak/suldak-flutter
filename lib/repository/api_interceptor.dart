part of suldak_api;

class _DioInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data as Map?;
    if (data != null) {
      // success 상태에 따라 error interceptor 로 전달
      if (!data['success']) {
        final exception = DioException(
          requestOptions: response.requestOptions,
          message: data['message'],
          response: response,
          type: DioExceptionType.unknown,
          error: {
            'success': data['success'],
            'errorCode': data['errorCode'],
            'msg': data['message'],
          },
        );
        handler.reject(exception, true);
      } else {
        handler.resolve(response);
      }
    } else {
      super.onResponse(response, handler);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('‼️ API 에러 발생 ‼️', name: 'Error Interceptor');
    log('‼️ status code: ${err.response?.statusCode}', name: 'Error Interceptor');
    log('‼️ end ponint: ${err.requestOptions.path}', name: 'Error Interceptor');
    log('‼️ error message: ${err.message}', name: 'Error Interceptor');
    log('‼️ error: ${err.error.toString()}', name: 'Error Interceptor');
    log('‼️ res code: ${err.response?.data['errorCode']}', name: 'Error Interceptor');
    log('‼️ res message: ${err.response?.data['message']}', name: 'Error Interceptor');
    log(' ------------------------------------', name: 'Error Interceptor');

    handler.resolve(Response(
      requestOptions: err.requestOptions,
      statusCode: err.response?.statusCode,
      data: err.response?.data ?? (err.error is Map ? err.error : null),
    ));

    // 하단 주석 코드는 accessToken, refreshToken을 사용해 만료된 accessToken을
    // refreshToken을 사용해 재발급 받고 실패한 request를 재실행하는 과정이다
    // // token error
    // if (err.response?.data['errorCode'] == 9999) {
    //   log('‼️ 9999 token error', name: 'Error Interceptor');
    //
    //   // Refresh the user's authentication token.
    //   final res = await AuthRepository.to.reissueToken();
    //
    //   if (res != null) {
    //     log('‼️ 토큰 재발급 성공', name: 'Error Interceptor');
    //     await GlobalController.to.saveUserInfo(res);
    //   } else {
    //     log('‼️ 토큰 재발급 실패', name: 'Error Interceptor');
    //     Toast.show(msg: 'login_again'.tr);
    //     get_x.Get.offAllNamed(Routes.login);
    //     return;
    //   }
    //
    //   // Retry the request.
    //   try {
    //     log('‼️ 이전 api 재실행: ${err.requestOptions.path}', name: 'Error Interceptor');
    //     handler.resolve(await _retry(err.requestOptions));
    //   } on DioException catch (e) {
    //     log('‼️ 이전 api 재실행 중 에러: ${e.error.toString()}', name: 'Error Interceptor');
    //
    //     // If the request fails again, pass the error to the next interceptor in the chain.
    //     handler.next(e);
    //   }
    //   // Return to prevent the next interceptor in the chain from being executed.
    //   return;
    // }
    //
    // handler.resolve(err.response ??
    //     Response(
    //       requestOptions: err.requestOptions,
    //       statusCode: err.response?.statusCode,
    //       data: err.error is Map ? err.error : null,
    //     ));
  }

  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   Map<String, dynamic> header = {};
  //
  //   final token = GetStorage().read<String>(Keys.refreshToken);
  //   if (token != null) {
  //     header['Authorization'] = token;
  //   }
  //
  //   // Create a new `RequestOptions` object with the same method, path, data, and query parameters as the original request.
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: header,
  //   );
  //
  //   // Retry the request with the new `RequestOptions` object.
  //   return _dio.request<dynamic>(
  //     requestOptions.path,
  //     data: requestOptions.data,
  //     queryParameters: requestOptions.queryParameters,
  //     options: options,
  //   );
  // }
}
