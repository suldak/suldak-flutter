import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'social_step_1/social_step_1_page.dart';

class SignUpInfoInputController extends GetxController {
  static SignUpInfoInputController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  RxList<Widget> pages = <Widget>[
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ].obs;

  final pageViewController = PageController(initialPage: 0);

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      final isSocial = Get.arguments['isSocial'];
      if (isSocial) {
        pages.insert(0, SocialStep1Page());
      } else {
        pages.insert(0, Container(color: Colors.orange,));
      }
    }
  }
}