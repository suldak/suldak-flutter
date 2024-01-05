class BaseResponse {
  bool? success;
  int? errorCode;
  String? message;
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
