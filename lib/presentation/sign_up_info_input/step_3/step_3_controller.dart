import 'package:get/get.dart';

import '../../profile_setting/profile_setting_controller.dart';

class Step3Controller extends GetxController {
  static ProfileSettingController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  List<String> drinkTags = [
    '소주',
    '맥주',
    '칵테일',
    '하이볼',
    '와인',
    '양주',
    '전통주',
  ];
  RxList<bool> drinkTagsSelection = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

// Functions ▼ ------------------------------------------------------

// Life Cycle ▼ ------------------------------------------------------
}
