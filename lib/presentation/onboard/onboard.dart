import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:suldak_suldak/presentation/onboard/onboardController.dart';

import '../../config/colors.dart';

class Onboard extends StatelessWidget {
  Onboard({super.key});

  final OnboardController onboardController = OnboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(18.0),
        height: double.infinity,
        child: IntroductionScreen(
          pages: [
            // page 1
            onboardController.onboardPage(context, 'onboard_first1', 'onboard_first2',
                'onboard_first3', "assets/svg/beer_illustrator.svg"),

            // page 2
            onboardController.onboardPage(
                context,
                'onboard_second1',
                'onboard_second2',
                'onboard_second3',
                "assets/svg/beer_friend_illustrator.svg"),

            // page 3
            onboardController.onboardPage(context, 'onboard_third1', 'onboard_third2',
                'onboard_third3', "assets/svg/invite_illustrator.svg"),
          ],
          animationDuration: 300,
          showSkipButton: true,
          skip: Text(
            'skip'.tr,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey[70]),
          ),
          onSkip: () {
            OnboardController.to.navigateOnboardToLastPage();
          },
          next: Text(
            'next'.tr,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primary),
          ),
          done: Text(
            'next'.tr,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primary),
          ),
          onDone: () {
            OnboardController.to.navigateOnboardToLastPage();
          },
        ),
      ),
    );
  }
}
