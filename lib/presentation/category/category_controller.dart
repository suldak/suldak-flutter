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

  // text: controller.liquorTagList[index].name! 이거만 모아서 리턴
  RxList<String> getCategoryList() {
    RxList<String> categoryList = <String>[].obs;
    for (int i = 0; i < liquorTagList.length; i++) {
      categoryList.add(liquorTagList[i].name!);
    }
    return categoryList;
  }

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }
  // Life Cycle ▼ ------------------------------------------------------
}