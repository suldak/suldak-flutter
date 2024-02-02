import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'make_meeting_step_1/make_meeting_step_1_page.dart';

class MakeMeetingMainController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  RxList<Widget> pages = <Widget>[].obs;

  final pageViewController = PageController(initialPage: 0);

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

   pages.add(const MakeMeetingStep1Page());
  }
}