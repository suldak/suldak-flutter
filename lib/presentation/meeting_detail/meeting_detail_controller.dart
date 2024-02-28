import 'package:get/get.dart';

import '../../model/meeting.dart';

class MeetingDetailController extends GetxService {

  // Variable ▼ ------------------------------------------------------

  Rx<Meeting?> meeting = Rx<Meeting?>(null);

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      meeting.value = Get.arguments['meeting'];
    }
  }
}