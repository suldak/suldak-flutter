/// ## 서버에서 받아오는 기본적인 api 의 response 형식입니다
/// data에는 실제로 받아서 사용자에게 표시해주거나, 처리해주어야하는 정보가 들어있습니다
///
/// [BaseResponse]에 있는 [success], [errorCode]등을 확인해
/// 오류가 발생했는지, 정상처리되었는지 확인해 그에 따른 행동을 정할 수 있게끔 합니다
class BaseResponse {

  /// api 요청의 성공 여부
  bool? success;
  /// 서버에서 정의한 해당 api요청의 오류 코드
  int? errorCode;
  /// 서버에서 보내는 api 요청의 에러 메세지
  String? message;
  /// api요청의 response (실제 데이터)
  dynamic data;

  BaseResponse({
    this.success,
    this.errorCode,
    this.message,
    this.data,
  });

  BaseResponse.fromJson(Map json) {
    success = json['success'];
    errorCode = json['errorCode']?.toInt();
    message = json['message']?.toString();
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['errorCode'] = errorCode;
    data['message'] = message;
    data['data'] = data.toString();
    return data;
  }
}
