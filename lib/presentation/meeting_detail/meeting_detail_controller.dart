import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';
import '../../global_controller.dart';
import '../../model/meeting.dart';
import '../../model/meeting_comment.dart';
import '../../model/meeting_comment_list.dart';
import '../../model/user.dart';
import '../../repository/meeting_repo.dart';
import '../../utils/toast.dart';

class MeetingDetailController extends GetxController {

  static MeetingDetailController get to => Get.find<MeetingDetailController>();

  // Variable ▼ ------------------------------------------------------

  GlobalController globalController = GlobalController.to;

  Rx<Meeting?> meeting = Rx<Meeting?>(null);

  RxList<MeetingComment> meetingCommentList = <MeetingComment>[].obs;

  TextEditingController commentController = TextEditingController();

  UserModel? userData;

  // Functions ▼ ------------------------------------------------------

  void getMeetingDetail(int meetingPk) async {
    final Meeting? res =
        await MeetingRepo.to.getMeetingInfo(meetingPk: meetingPk);

    if (res != null) {
      meeting.value = res;
    }
  }

  void getMeetingComments(int meetingPk) async {
    final MeetingCommentRootList? res =
        await MeetingRepo.to.getMeetingComment(
      meetingPk: meetingPk,
    );

    if (res != null) {
      meetingCommentList.value = res.list;
    }
  }

  void onRegisterComment() async {
    final comment = commentController.text;

    if (comment.isEmpty) {
      return;
    }

    final res = await MeetingRepo.to.postMeetingComment(
      meetingPk: meeting.value!.id!,
      comment: comment,
    );

    if (res != null) {
      getMeetingComments(meeting.value!.id!);
    }
  }

  void deleteComment(int commentPk) async {
    final res = await MeetingRepo.to.deleteMeetingComment(
      commentPk: commentPk,
    );

    if (res != null) {
      getMeetingComments(meeting.value!.id!);
    }
  }

  void reportMeetingComment(int meetingCommentPk) async {
    final res = await MeetingRepo.to.reportMeetingComment(
      commentPk: meetingCommentPk,
    );

    if (res != null) {
      Toast.show(msg: 'report_complete'.tr);
      getMeetingComments(meeting.value!.id!);
    }
  }

  void onApplyMeeting() async {
    final res = await Get.toNamed(
      Routes.meetingApply,
      arguments: {'meeting': meeting.value},
    );

    if (res['apply_meeting'] != null) {
      // 모임을 새로고침 후 guestType 확인, ui 업데이트 필요
    }
  }

  // Life Cycle ▼ ------------------------------------  ------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      int meetingPk = Get.arguments['meetingPk'];

      getMeetingDetail(meetingPk);
      getMeetingComments(meetingPk);
    }

    userData = globalController.userData;
  }
}