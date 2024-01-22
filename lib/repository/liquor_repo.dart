import 'package:get/get.dart';

import '../config/const.dart';
import '../model/liquor_list.dart';
import 'base_api.dart';

class LiquorRepository extends GetxService with API {

  @override
  String get apiName => 'Liquor API';

  static LiquorRepository get to => Get.find<LiquorRepository>();

  static const _userSearchedLiquorEp = '/api/liquor/user';

  Future<LiquorList?> getUserLiquorList({
    int page = 0,
    int size = 10,
    required SearchLiquorType type,
    OnServerException? onServerException,
}) async {
    final res = await get(
      _userSearchedLiquorEp,
      data: {
        'pageNum': page,
        'recordSize': size,
        'searchType': type.name.toUpperCase(),
      },
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      LiquorList liquorList = LiquorList(data['data']);
      return liquorList;
    }
    return null;
  }
}