import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'email_step_1/email_step_1_controller.dart';
import 'email_step_1/email_step_1_page.dart';
import 'social_step_1/social_step_1_controller.dart';
import 'social_step_1/social_step_1_page.dart';

class SignUpInfoInputController extends GetxController {
  static SignUpInfoInputController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  bool isSocial = true;

  RxList<Widget> pages = <Widget>[
    SizedBox(),
    SizedBox(),
  ].obs;

  Rx<bool> step1NextAvailable = false.obs;

  final pageViewController = PageController(initialPage: 0);

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      final res = Get.arguments['isSocial'];
      isSocial = res;
      if (isSocial) {
        pages.insert(0, const SocialStep1Page());
      } else {
        pages.insert(0, const EmailStep1Page());
      }
    }
  }

  @override
  void onReady() {
    super.onReady();

    if (isSocial) {
      SocialStep1Controller.to.isAllReqAgree.listen((val) {
        step1NextAvailable.value = val;
      });
    } else {
      EmailStep1Controller.to.isAllReqAgree.listen((val) {
        step1NextAvailable.value = val;
      });
    }
  }
}
