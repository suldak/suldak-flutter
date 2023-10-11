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

  List<String> moodTags = [
    '왁자지껄 회식 분위기',
    '도란도란 조용한 분위기',
    '감성넘치는 펍',
    '술게임과 함께',
  ];
  RxList<bool> moodTagsSelection = [
    false,
    false,
    false,
    false,
  ].obs;

  List<String> snackTags = [
    '계속 들어가는 마른안주',
    '새콤달콤 과일안주',
    '해장도 함께하는 국물안주',
    '고소+짭조름 치즈안주',
    '바삭한 튀김안주',
  ];
  RxList<bool> snackTagsSelection = [
    false,
    false,
    false,
    false,
    false,
  ].obs;

  List<String> flavorTags = [
    '술맛 나는 술',
    '달달한 술',
    '상큼한 술',
    '끝맛이 깔끔한 술',
    '여운이 오래가는 술',
    '탄산이 들어간 술',
    '부드러운 술',
  ];
  RxList<bool> flavorTagsSelection = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;

  List<String> capacityTags = [
    '잘 못 마셔요',
    '반 병 ~ 1병',
    '1병 ~ 2병',
    '2병 이상',
    '잘 모르겠어요',
  ];
  RxList<bool> capacityTagsSelection = [
    false,
    false,
    false,
    false,
    false,
  ].obs;

// Functions ▼ ------------------------------------------------------

// Life Cycle ▼ ------------------------------------------------------
}
