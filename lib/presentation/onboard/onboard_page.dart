import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:suldak_suldak/presentation/onboard/onboard_controller.dart';

import '../../config/colors.dart';

class OnboardPage extends GetView<OnboardController> {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(18.0),
        height: double.infinity,
        child: IntroductionScreen(
          pages: [
            // page 1
            onboardPage(context, 'onboard_first1', 'onboard_first2',
                'onboard_first3', "assets/svg/beer_illustrator.svg"),

            // page 2
            onboardPage(context, 'onboard_second1', 'onboard_second2',
                'onboard_second3', "assets/svg/beer_friend_illustrator.svg"),

            // page 3
            onboardPage(context, 'onboard_third1', 'onboard_third2',
                'onboard_third3', "assets/svg/invite_illustrator.svg"),
          ],
          animationDuration: 300,
          showSkipButton: true,
          skip: Text(
            'skip'.tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey[700],
            ),
          ),
          onSkip: () => controller.navigateOnboardToLastPage(),
          next: Text(
            'next'.tr,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          done: Text(
            'next'.tr,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          onDone: () => controller.navigateOnboardToLastPage(),
        ),
      ),
    );
  }

  PageViewModel onboardPage(BuildContext context, String title,
      String boldTitle, String lastTitle, String imagePath) {
    return PageViewModel(
      titleWidget: Container(
        padding: MediaQuery
            .of(context)
            .padding * 2,
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
}
