import 'package:get/get.dart';
import 'package:suldak_suldak/repository/base_api.dart';

import '../model/liquor_tag.dart';

class TagRepository extends GetxService with API {

  @override
  String get apiName => 'Tag API';

  static TagRepository get to => Get.find<TagRepository>();

  static const _liquorNameEp = '/tag/view/liquor-name';

  Future<List<LiquorTagModel>?> getLiquorNameTagList({
    OnServerException? onServerException,
  }) async {
    final res = await get(_liquorNameEp);

    final data = res.validateData(onServerException);

    if (data != null) {
      List<dynamic> tagList = data['data'];
      return tagList
          .map((dataJson) => LiquorTagModel.fromJson(dataJson))
          .toList();
    }
    return null;
  }
}