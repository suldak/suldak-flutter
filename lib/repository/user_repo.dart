import 'package:get/get.dart';

import '../model/base_response.dart';
import 'base_api.dart';

/// ## 사용자 정보 관련 api repository
/// 사용자의 정보 및 관리 관련 api를 처리하는 repo
class UserRepository extends GetxService with API {
  @override
  String get apiName => 'Auth API';

  static UserRepository get to => Get.find<UserRepository>();

  static const _nicknameEp = '/api/user/user-nickname';

  Future<BaseResponse?> checkNickname({
    required String nickname,
    OnServerException? onServerException,
  }) async {
    final res = await get(
      _nicknameEp,
      data: {'nickname': nickname},
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }
}
