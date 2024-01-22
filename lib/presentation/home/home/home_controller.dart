import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../../global_controller.dart';
import '../../../model/liquor.dart';
import '../../../model/liquor_tag.dart';
import '../../../repository/liquor_repo.dart';
import '../../../repository/tag_repo.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

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

  RxList<LiquorTagModel> liquorTagList = <LiquorTagModel>[].obs;

  RxList<LiquorModel> userSearchLiquorList = <LiquorModel>[].obs;

  // Functions ▼ ------------------------------------------------------

  void getLiquorNameTagList() async {
    final tagData = await TagRepository.to.getLiquorNameTagList();
    if (tagData != null) {
      liquorTagList.value = tagData;
    }
  }

  void getUserSearchedLiquorList() async {
    final liquorData = await LiquorRepository.to.getUserSearchLiquorList();
    if (liquorData != null) {
      userSearchLiquorList.value = liquorData;
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
