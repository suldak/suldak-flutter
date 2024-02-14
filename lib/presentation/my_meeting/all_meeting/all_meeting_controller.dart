import 'package:get/get.dart';

import '../../../config/const.dart';
import '../../../config/routes.dart';
import '../../../gen/assets.gen.dart';
import '../../../global_controller.dart';
import '../../../model/meeting.dart';
import '../../../repository/meeting_repo.dart';

class AllMeetingController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  final sampleProfile = [
    Assets.sample.jerry,
    Assets.sample.pepe,
    Assets.sample.squidward,
  ];

  RxList<Meeting> myHostMeetingList = <Meeting>[].obs;
  RxList<Meeting> myConfirmMeetingList = <Meeting>[].obs;
  RxList<Meeting> myWaitMeetingList = <Meeting>[].obs;

  // Functions ▼ ------------------------------------------------------

  // 현재는 그냥 화면으로 보내주지만, 화면의 ??모임을 눌렀을 때 api를 호출해 리스트를 받아서 페이지로 전달
  // - 이미 이전 페이지에서 보여질 리스트를 로딩했기 때문에 이렇게 작성했음
  void goMeetingListPage({
    required String title,
    required String emptyText,
    required List<Meeting> meeting,
  }) {
    Get.toNamed(
      Routes.meetingList,
      arguments: {
        'title': title,
        'emptyText': emptyText,
        'meeting': meeting,
      },
    );
  }

  void getMyHostMeeting() async {
    final int userPk = GlobalController.to.userData!.id!;
    final List<Meeting>? hostMeetingList = await MeetingRepo.to.getUserHostMeetingList(
      userPk: userPk,
      isLatest: true,
    );

    if (hostMeetingList != null) {
      myHostMeetingList.value = hostMeetingList;
    }
  }

  void getConfirmedMeeting() async {
    final int userPk = GlobalController.to.userData!.id!;
    final List<Meeting>? hostMeetingList = await MeetingRepo.to.getUserMeetingList(
      userPk: userPk,
      isLatest: true,
      confirm: MeetingGuestType.confirm,
    );

    if (hostMeetingList != null) {
      myConfirmMeetingList.value = hostMeetingList;
    }
  }

  void getWaitingMeeting() async {
    final int userPk = GlobalController.to.userData!.id!;
    final List<Meeting>? hostMeetingList = await MeetingRepo.to.getUserMeetingList(
      userPk: userPk,
      isLatest: true,
      confirm: MeetingGuestType.wait,
    );

    if (hostMeetingList != null) {
      myWaitMeetingList.value = hostMeetingList;
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    getMyHostMeeting();
    getConfirmedMeeting();
    getWaitingMeeting();
  }
}