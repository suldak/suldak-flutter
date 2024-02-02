import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMeetingMainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Variable ▼ ------------------------------------------------------

  /// tab bar controller
  late TabController tabController;


  /// selected tab bar index
  Rx<int> selectedTab = 0.obs;

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      selectedTab.value = tabController.index;
    });
  }
}