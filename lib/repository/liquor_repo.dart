import 'package:get/get.dart';

import '../model/liquor.dart';
import 'base_api.dart';

class LiquorRepository extends GetxService with API {

  @override
  String get apiName => 'Liquor API';

  static LiquorRepository get to => Get.find<LiquorRepository>();

  static const _userSearchedLiquorEp = '/liquor/user-liquor';

  Future<List<LiquorModel>?> getUserSearchLiquorList({
    int page = 0,
    int size = 10,
    OnServerException? onServerException,
}) async {
    final res = await get(
      _userSearchedLiquorEp,
      data: {
        'pageNum': page,
        'recordSize': size,
      },
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      List<dynamic> liquorList = data['data'];
      return liquorList
          .map((dataJson) => LiquorModel.fromJson(dataJson))
          .toList();
    }
    return null;
  }
}