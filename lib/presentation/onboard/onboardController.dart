import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../config/routes.dart';

class OnboardController extends GetxController {
  static OnboardController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void navigateOnboardToLastPage() async {
    Get.offAllNamed(
      "${Routes.onboarding}/lastpage",
    );
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
              TextSpan(text: title),
              TextSpan(
                text: boldTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: lastTitle)
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
