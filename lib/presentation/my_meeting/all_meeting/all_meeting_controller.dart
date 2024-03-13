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

  void goMeetingListPage({
    required String title,
    required String emptyText,
    required Future<List<Meeting>> Function(int page) pagination,
  }) {
    Get.toNamed(
      Routes.meetingList,
      arguments: {
        'title': title,
        'emptyText': emptyText,
        'pagination': pagination,
      },
    );
  }

  Future<List<Meeting>> getMyHostMeeting(int pageKey) async {
    final int userPk = GlobalController.to.userData!.id!;
    final List<Meeting>? hostMeetingList = await MeetingRepo.to.getUserHostMeetingList(
      userPk: userPk,
      isLatest: true,
    );

    if (hostMeetingList != null) {
      myHostMeetingList.value = hostMeetingList;
      return hostMeetingList;
    }
    return [];
  }

  Future<List<Meeting>> getConfirmedMeeting(int pageKey) async {
    final int userPk = GlobalController.to.userData!.id!;
    final List<Meeting>? hostMeetingList = await MeetingRepo.to.getUserMeetingList(
      userPk: userPk,
      isLatest: true,
      confirm: MeetingGuestType.confirm,
    );

    if (hostMeetingList != null) {
      myConfirmMeetingList.value = hostMeetingList;
      return hostMeetingList;
    }
    return [];
  }

  Future<List<Meeting>> getWaitingMeeting(int pageKey) async {
    final int userPk = GlobalController.to.userData!.id!;
    final List<Meeting>? hostMeetingList = await MeetingRepo.to.getUserMeetingList(
      userPk: userPk,
      isLatest: true,
      confirm: MeetingGuestType.wait,
    );

    if (hostMeetingList != null) {
      myWaitMeetingList.value = hostMeetingList;
      return hostMeetingList;
    }
    return [];
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    getMyHostMeeting(0);
    getConfirmedMeeting(0);
    getWaitingMeeting(0);
  }
}