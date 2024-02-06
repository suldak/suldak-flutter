import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';

enum MyMeetingSort {
  latest, earliest
}

class MyMeetingController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  final sampleProfile = [
    Assets.sample.jerry,
    Assets.sample.pepe,
    Assets.sample.squidward,
  ];

  Rx<MyMeetingSort> selectedSort = MyMeetingSort.latest.obs;

  // Functions ▼ ------------------------------------------------------

  void onTapSortItem(MyMeetingSort sort) {
    selectedSort.value = sort;

    // 나중에 바뀐 sort type으로 api 호출 등의 작업 수행
  }

  // Life Cycle ▼ ------------------------------------------------------
}