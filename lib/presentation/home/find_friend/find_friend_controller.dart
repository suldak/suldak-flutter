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

  DateTime selectedDate = DateTime.now();

  // Functions ▼ ------------------------------------------------------

  void navigateMakeFriend() {
    Get.toNamed(Routes.makeMeeting);
  }

  void goMeetingListPage({
    required String title,
    required String emptyText,
    required List<Meeting> meeting,
    required Future<List<Meeting>> Function(int page) pagination,
  }) {
    Get.toNamed(
      Routes.meetingList,
      arguments: {
        'title': title,
        'emptyText': emptyText,
        'meeting': meeting,
        'pagination': pagination,
      },
    );
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

  Future<List<Meeting>> getNewMeetingList(int pageKey) async {
    final res = await MeetingRepo.to.searchMeetingList(
      page: pageKey,
      size: 10,
      isLatest: true,
    );

    if (res != null) {
      newMeetingList.value = res;
      return res;
    }
    return [];
  }

  Future<List<Meeting>> getDateMeetingList(int pageKey) async {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss');
    final startDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      0,
      0,
      0,
    );
    final endDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      23,
      59,
      59,
    );
    final res = await MeetingRepo.to.searchMeetingList(
      page: 0,
      size: 10,
      isLatest: true,
      searchStartTime: dateFormat.format(startDate),
      searchEndTime: dateFormat.format(endDate),
    );

    if (res != null) {
      dateMeetingList.value = res;
      return res;
    }
    return [];
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    getPopularMeetingList();
    getRecommendMeetingList();
    getNewMeetingList(0);
    getDateMeetingList(0);
  }
}