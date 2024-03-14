import 'package:get/get.dart';

import '../../config/routes.dart';
import '../../model/meeting.dart';

class MeetingApplyController extends GetxController {
  // Variable ▼ ------------------------------------------------------

  Rx<Meeting?> meeting = Rx<Meeting?>(null);

  // Functions ▼ ------------------------------------------------------

  void onNext() async {
    final res = await Get.toNamed(Routes.meetingApplyInfo);

    if (res['apply_meeting']) {
      Get.back(result: {'apply_meeting': true});
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      final meetingArg = Get.arguments['meeting'];
      meeting.value = meetingArg;
    }
  }
}