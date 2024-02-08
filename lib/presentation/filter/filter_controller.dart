import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Variable ▼ ------------------------------------------------------

  Rx<bool> isCalendarExpanded = false.obs;

  late AnimationController animationController;
  late Animation<double> heightFactor;

  // Functions ▼ ------------------------------------------------------

  void onTapExpandCalendar() {
    isCalendarExpanded.value = !isCalendarExpanded.value;

    if (isCalendarExpanded.value) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    heightFactor = animationController.drive(CurveTween(curve: Curves.easeIn));
  }
}