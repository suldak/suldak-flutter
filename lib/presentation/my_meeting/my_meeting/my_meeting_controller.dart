import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../config/const.dart';
import '../../../config/routes.dart';
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
    );

    if (meeting != null) {

    }
  }

  void onTapFilter() async {
    final filterRes = await Get.toNamed(Routes.filter);
    final PickerDateRange? dateSelection = filterRes['dateSelection'];
    final List<int>? selectedTagList = filterRes['selectedTagList'];
    final MeetingType? selectedMeetingType = filterRes['selectedMeetingType'];

    final DateFormat dateFormat = DateFormat();
    final String? startDate = dateSelection?.startDate != null
        ? dateFormat.format(dateSelection!.startDate!)
        : null;
    final String? endDate = dateSelection?.endDate != null
        ? dateFormat.format(dateSelection!.endDate!)
        : startDate;

    final int userPk = GlobalController.to.userData!.id!;
    final List<Meeting>? meeting = await MeetingRepo.to.getUserMeetingList(
      userPk: userPk,
      isLatest: selectedSort.value == MyMeetingSort.latest ? true: false,
      confirm: MeetingGuestType.complete,
      type: selectedMeetingType,
      partTagKey: selectedTagList,
      searchStartTime: startDate,
      searchEndTime: endDate,
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