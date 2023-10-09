import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../config/routes.dart';
import '../../language.dart';

class OnboardController extends GetxController {
  static OnboardController get to => Get.find();

  // Variable ▼ ------------------------------------------------------
  final storage = GetStorage();
  final Languages languages = Get.put(Languages());

  // Functions ▼ ------------------------------------------------------

  void navigateOnboardToLastPage() async {
    Get.offAllNamed(
      "${Routes.onboarding}/lastpage",
    );
  }

  void saveBoolData(String key, bool value) {
    storage.write(key, value);
  }

  void navigateLogin() async {
    Get.offAllNamed(Routes.login);
  }

  PageViewModel onboardPage(BuildContext context, String title,
      String boldTitle, String lastTitle, String imagePath) {
    return PageViewModel(
      titleWidget: Container(
        padding: MediaQuery.of(context).padding * 2,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            // 공통스타일
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
            children: [
              TextSpan(text: title.tr),
              TextSpan(
                text: boldTitle.tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: lastTitle.tr)
            ],
          ),
        ),
      ),

      // 이미지 부분
      bodyWidget: Stack(
        children: [
          CircleAvatar(
            radius: 126.5,
            backgroundColor: Colors.black.withOpacity(0.8),
            child: SvgPicture.asset(
              imagePath,
              width: 188,
              height: 161,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  // Life Cycle ▼ ------------------------------------------------------
}
