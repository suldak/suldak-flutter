import 'package:get/get.dart';

import '../../model/meeting.dart';
import '../../repository/meeting_repo.dart';
import '../../utils/toast.dart';

class MeetingApplyInfoController extends GetxController {
  // Variable ▼ ------------------------------------------------------

  Meeting? meeting;

  // Functions ▼ ------------------------------------------------------

  void applyMeeting() async {
    Get.back(result: {'apply_meeting': true});
    return;
    final res = await MeetingRepo.to.applyMeeting(
      meetingPk: meeting!.id!,
    );

    if (res != null) {
      Toast.show(msg: 'apply_complete'.tr);
      Get.back(result: {'apply_meeting': true});
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      final meetingArg = Get.arguments['meeting'];
      meeting = meetingArg;
    }
  }
}