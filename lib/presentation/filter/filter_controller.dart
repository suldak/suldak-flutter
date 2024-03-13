import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../config/const.dart';
import '../../model/tag.dart';
import '../../repository/tag_repo.dart';

class FilterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Variable ▼ ------------------------------------------------------

  Rx<bool> isCalendarExpanded = false.obs;

  List<String> sampleTagList = [
    '취업준비',
    '회사생활',
    '반려동물',
    '술',
    '영화/드라마',
    '운동/건강',
    '음식',
    '여행',
    '소소한 일상',
    '취미생활_야외(캠핑 · 낚시 등)',
    '취미생활_실내(DIY · 독서 등)',
    '연애',
    '기타',
  ];

  late AnimationController animationController;
  late Animation<double> heightFactor;

  DateRangePickerController dateRangePickerController =
      DateRangePickerController();

  Rx<PickerDateRange?> dateSelection = Rx<PickerDateRange?>(null);

  RxList<TagModel> meetingTagList = <TagModel>[].obs;
  RxList<int> selectedTagKeyList = <int>[].obs;
  Rx<MeetingType?> selectedMeetingType = Rx(null);

  // Functions ▼ ------------------------------------------------------

  void onTapExpandCalendar() {
    isCalendarExpanded.value = !isCalendarExpanded.value;

    if (isCalendarExpanded.value) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  void onChangeDateSelection(PickerDateRange selection) {
    dateSelection.value = selection;
  }

  void onTapMeetingTagWidget(TagModel tag) {
    if (selectedTagKeyList.contains(tag.id)) {
      selectedTagKeyList.remove(tag.id);
    } else {
      selectedTagKeyList.add(tag.id!);
    }
  }

  String getCalendarString() {
    if (dateSelection.value == null) return 'entire_period'.tr;

    if (dateSelection.value!.endDate == null) {
      return DateFormat('yyyy.MM.dd').format(dateSelection.value!.startDate!);
    }

    final startDate = DateFormat('yyyy.MM.dd').format(dateSelection.value!.startDate!);
    final endDate = DateFormat('yyyy.MM.dd').format(dateSelection.value!.endDate!);

    return '$startDate ~ $endDate';
  }

  void getMeetingTagList() async {
    final List<TagModel>? tagList = await TagRepository.to.getMeetingTagList();

    if (tagList != null) {
      meetingTagList.value = tagList;
    }
  }

  void onTapResetButton() {
    dateSelection.value = null;
    selectedTagKeyList.value = <int>[].obs;
    selectedMeetingType.value = null;
    dateRangePickerController.selectedRange =
        PickerDateRange(DateTime.now(), DateTime.now());
  }

  void onTapApplyFilter() {
    Get.back(result: {
      'dateSelection': dateSelection.value,
      'selectedTagList': selectedTagKeyList,
      'selectedMeetingType': selectedMeetingType.value,
    });
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    heightFactor = animationController.drive(CurveTween(curve: Curves.easeIn));

    getMeetingTagList();
  }
}