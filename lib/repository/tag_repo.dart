import 'package:get/get.dart';
import 'package:suldak_suldak/repository/base_api.dart';

import '../model/tag.dart';

class TagRepository extends GetxService with API {

  @override
  String get apiName => 'Tag API';

  static TagRepository get to => Get.find<TagRepository>();

  static const _liquorNameEp = '/api/tag/view/liquor-name';
  static const _meetingTagEp = '/api/tag/view/party-tag';

  Future<List<TagModel>?> getLiquorNameTagList({
    OnServerException? onServerException,
  }) async {
    final res = await get(_liquorNameEp);

    final data = res.validateData(onServerException);

    if (data != null) {
      List<dynamic> tagList = data['data'];
      return tagList
          .map((dataJson) => TagModel.fromJson(dataJson))
          .toList();
    }
    return null;
  }

  Future<List<TagModel>?> getMeetingTagList({
    OnServerException? onServerException,
  }) async {
    final res = await get(_meetingTagEp);

    final data = res.validateData(onServerException);

    if (data != null) {
      List<dynamic> tagList = data['data'];
      return tagList
          .map((dataJson) => TagModel.fromJson(dataJson))
          .toList();
    }
    return null;
  }
}