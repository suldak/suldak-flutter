import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/liquor_tag.dart';

class CategoryController extends GetxController {

  // Variable ▼ ------------------------------------------------------
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

  RxString selectedCategory = '와인'.obs;

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();
    String selectedItem = Get.arguments;
    selectedCategory.value = selectedItem;
  }
}