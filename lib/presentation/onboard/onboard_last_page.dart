import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../config/colors.dart';
import 'onboard_controller.dart';

class OnboardLastPage extends GetView<OnboardController> {
  const OnboardLastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(18.0),
        height: double.infinity,
        child: IntroductionScreen(
          pages: [
            // page 4
            onboardPage(context, 'onboard_last1', 'onboard_last2',
                'onboard_last3', 'assets/svg/bird_illustrator.svg'),
          ],
          showDoneButton: false,
          showNextButton: false,
          isProgress: false,
          globalFooter: Container(
            // 시작하기 버튼
            padding: const EdgeInsets.only(bottom: 34),
            height: 90,
            child: ElevatedButton(
              onPressed: controller.onCompleteOnboarding,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(327, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'start'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel onboardPage(
    BuildContext context,
    String title,
    String boldTitle,
    String lastTitle,
    String imagePath,
  ) {
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: lastTitle.tr),
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
}
