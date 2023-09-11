import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'email_step_1/email_step_1_page.dart';
import 'social_step_1/social_step_1_page.dart';
import 'step_2/step_2_page.dart';

class SignUpInfoInputController extends GetxController {
  static SignUpInfoInputController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  bool isSocial = true;

  RxList<Widget> pages = <Widget>[].obs;

  final pageViewController = PageController(initialPage: 0);

  // Functions ▼ ------------------------------------------------------

  void onNextPage() {
    pageViewController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      final isSocial = Get.arguments['isSocial'];
      if (isSocial) {
        pages.add(SocialStep1Page(onNextPage: onNextPage));
      } else {
        pages.add(EmailStep1Page(onNextPage: onNextPage));
      }
    }
    pages.add(Step2Page(onNextPage: onNextPage));
    pages.add(const SizedBox());
  }
}
