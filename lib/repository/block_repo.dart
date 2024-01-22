import 'package:get/get.dart';

import '../model/base_response.dart';
import '../model/blocked_user.dart';
import 'base_api.dart';

class BlockRepository extends GetxService with API {
  @override
  String get apiName => 'Block API';

  static BlockRepository get to => Get.find<BlockRepository>();

  static const _userBlockEp = '/api/user/cut/user';

  Future<List<BlockedUser>?> getBlockedUser({
    OnServerException? onServerException,
  }) async {
    final res = await get(_userBlockEp);
    final data = res.validateData(onServerException);

    if (data != null) {
      List<dynamic> blockedUserList = data['data'];
      return blockedUserList
          .map((dataJson) => BlockedUser.fromJson(dataJson))
          .toList();
    }
    return null;
  }

  Future<BaseResponse?> blockUser({
    required int userKey,
    OnServerException? onServerException,
  }) async {
    final res = await post('$_userBlockEp/$userKey');
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }

  Future<BaseResponse?> cancelBlockUser({
    required int userKey,
    OnServerException? onServerException,
  }) async {
    final res = await delete('$_userBlockEp/$userKey');
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }
}