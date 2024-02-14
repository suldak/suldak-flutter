import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

  late RxList<bool> sampleSelection;

  late AnimationController animationController;
  late Animation<double> heightFactor;

  Rx<PickerDateRange?> dateSelection = Rx<PickerDateRange?>(null);

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

  String getCalendarString() {
    if (dateSelection.value == null) return 'entire_period'.tr;

    if (dateSelection.value!.endDate == null) {
      return DateFormat('yyyy.MM.dd').format(dateSelection.value!.startDate!);
    }

    final startDate = DateFormat('yyyy.MM.dd').format(dateSelection.value!.startDate!);
    final endDate = DateFormat('yyyy.MM.dd').format(dateSelection.value!.endDate!);

    return '$startDate ~ $endDate';
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    sampleSelection =
        RxList.generate(sampleTagList.length, (index) => false);

    animationController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    heightFactor = animationController.drive(CurveTween(curve: Curves.easeIn));
  }
}