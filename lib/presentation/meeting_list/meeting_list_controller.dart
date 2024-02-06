import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

class MeetingListController extends GetxController {
  // Variable ▼ ------------------------------------------------------

  Rx<String> title = ('meeting'.tr).obs;

  RxList<AssetGenImage> meetingList = <AssetGenImage>[].obs;

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    final titleArg = Get.arguments['title'];
    final meetingArg = Get.arguments['meeting'];

    if (titleArg != null && titleArg is String) {
      title.value = titleArg;
    }

    // 바로 위 코드처럼 모임 타입이 정해지면 이 arg가 모임 리스트 타입인지 확인
    if (meetingArg != null) {
      meetingList.value = meetingArg;
    }
  }
}