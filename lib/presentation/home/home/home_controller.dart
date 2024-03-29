import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/config/const.dart';

import '../../../config/routes.dart';
import '../../../gen/assets.gen.dart';
import '../../../global_controller.dart';
import '../../../model/liquor.dart';
import '../../../model/liquor_list.dart';
import '../../../model/tag.dart';
import '../../../repository/liquor_repo.dart';
import '../../../repository/tag_repo.dart';

class HomeController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  /// global controller
  final GlobalController globalController = GlobalController.to;

  /// page view controller
  final PageController pageController = PageController();

  /// sample banner image list
  List<Image> sampleImageList = [
    Assets.jpg.whiskey.image(height: 174, fit: BoxFit.cover),
    Assets.jpg.beer.image(height: 174, fit: BoxFit.cover),
    Assets.jpg.wine.image(height: 174, fit: BoxFit.cover),
    Assets.jpg.soju.image(height: 174, fit: BoxFit.cover),
  ];

  List<String> sampleCategoryList = [
    '소주',
    '맥주',
    '칵테일',
    '하이볼',
    '양주',
    '와인',
    '전통주',
    '기타',
    '무알콜',
  ];

  RxList<TagModel> liquorTagList = <TagModel>[].obs;

  // Life Cycle ▼ ------------------------------------------------------

  RxList<LiquorModel> userSearchLiquorList = <LiquorModel>[].obs;

  // Functions ▼ ------------------------------------------------------

  void navigateNotify() async {
    Get.toNamed(Routes.notify);
  }

  void navigateBanner() async {
    Get.toNamed(Routes.banner);
  }

  void getLiquorNameTagList() async {
    final List<TagModel>? tagData =
        await TagRepository.to.getLiquorNameTagList();
    if (tagData != null) {
      liquorTagList.value = tagData;
    }
  }

  void getUserSearchedLiquorList() async {
    final LiquorList? liquorData = await LiquorRepository.to
        .getUserLiquorList(type: SearchLiquorType.liquor);
    if (liquorData != null) {
      // pageable 사용시 rxlist.addAll(pageble.list)를
      // 사용해 이전 데이터에 새로 추가된 요소들이 계속해서 더해지도록 한다
      // 이 코드에서는 고정된 갯수의 리스트만 받아오기 때문에 addAll을 사용하지 않는다
      userSearchLiquorList.value = liquorData.list;
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    getLiquorNameTagList();
    getUserSearchedLiquorList();
  }
}
