import 'package:get/get.dart';

import '../../../config/const.dart';
import '../../../gen/assets.gen.dart';
import '../../../global_controller.dart';
import '../../../model/meeting.dart';
import '../../../repository/meeting_repo.dart';

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

  Map<String, dynamic> searchFilterMap = {};

  // Functions ▼ ------------------------------------------------------

  void onTapSortItem(MyMeetingSort sort) {
    selectedSort.value = sort;

    // 나중에 바뀐 sort type으로 api 호출 등의 작업 수행
    getUserCompleteMeeting();
  }

  void getUserCompleteMeeting() async {
    final int userPk = GlobalController.to.userData!.id!;
    final List<Meeting>? meeting = await MeetingRepo.to.getUserMeetingList(
      userPk: userPk,
      isLatest: selectedSort.value == MyMeetingSort.latest ? true: false,
      confirm: MeetingGuestType.complete,
      // type: ,
      // partTagKey: ,
      // searchStartTime: ,
      // searchEndTime: ,
    );

    if (meeting != null) {

    }
  }

  // Life Cycle ▼ ------------------------------------------------------
  @override
  void onInit() {
    super.onInit();
  }
}