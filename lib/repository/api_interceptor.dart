part of painterus_api;

class _DioInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data as Map?;
    if (data != null) {
      // success 상태에 따라 error interceptor 로 전달
      if (!data['success']) {
        handler.reject(DioException(
          requestOptions: response.requestOptions,
          message: data['message'],
          response: response,
          type: DioExceptionType.unknown,
          error: {
            'success': data['success'],
            'errorCode': data['errorCode'],
            'msg': data['message'],
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