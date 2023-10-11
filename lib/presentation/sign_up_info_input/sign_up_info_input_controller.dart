import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';
import 'email_step_1/email_step_1_page.dart';
import 'social_step_1/social_step_1_page.dart';
import 'step_2/step_2_page.dart';
import 'step_3/step_3_page.dart';

class SignUpInfoInputController extends GetxController {
  static SignUpInfoInputController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  bool isSocial = true;

  RxList<Widget> pages = <Widget>[].obs;

  final pageViewController = PageController(initialPage: 0);

  // Functions ▼ ------------------------------------------------------

  void onNextPage() {
    if (pages.length - 1 > (pageViewController.page?.toInt() ?? 0)) {
      pageViewController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.offAllNamed(Routes.home);
    }
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
    pages.add(Step3Page(onNextPage: onNextPage));
  }
}
