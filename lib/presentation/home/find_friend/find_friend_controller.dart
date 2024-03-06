import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suldak_suldak/model/meeting.dart';

import '../../../config/routes.dart';
import '../../../gen/assets.gen.dart';
import '../../../repository/meeting_repo.dart';

class FindFriendController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  final sampleProfile = [
    Assets.sample.jerry,
    Assets.sample.pepe,
    Assets.sample.squidward,
  ];

  RxList<Meeting> popularMeetingList = <Meeting>[].obs;
  RxList<Meeting> recommendMeetingList = <Meeting>[].obs;
  RxList<Meeting> newMeetingList = <Meeting>[].obs;
  RxList<Meeting> dateMeetingList = <Meeting>[].obs;

  // Functions ▼ ------------------------------------------------------

  void navigateMakeFriend() {
    Get.toNamed(Routes.makeMeeting);
  }

  void getPopularMeetingList() async {
    final res = await MeetingRepo.to.getPopularMeetingList(isGuest: true);

    if (res != null) {
      popularMeetingList.value = res;
    }
  }

  void getRecommendMeetingList() async {
    final res = await MeetingRepo.to.getRecommendMeetingList(isLevel: false);

    if (res != null) {
      recommendMeetingList.value = res;
    }
  }

  void getNewMeetingList() async {
    final res = await MeetingRepo.to.searchMeetingList(
      page: 1,
      size: 4,
      isLatest: true,
    );

    if (res != null) {
      newMeetingList.value = res;
    }
  }

  void getDateMeetingList(DateTime dateTime) async {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss');
    final startDate = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      0,
      0,
      0,
    );
    final endDate = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      23,
      59,
      59,
    );
    final res = await MeetingRepo.to.searchMeetingList(
      page: 1,
      size: 4,
      isLatest: true,
      searchStartTime: dateFormat.format(startDate),
      searchEndTime: dateFormat.format(endDate),
    );

    if (res != null) {
      newMeetingList.value = res;
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    getPopularMeetingList();
    getRecommendMeetingList();
    getNewMeetingList();
    getDateMeetingList(DateTime.now());
  }
}