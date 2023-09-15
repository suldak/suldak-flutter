import 'package:flutter/material.dart';
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
            onboardController.onboardPage(context, "\n지금 나에게 ", "딱맞는 술",
                "을\n추천받을 수 있어요", "assets/svg/beer_illustrator.svg"),

            // page 2
            onboardController.onboardPage(
                context,
                "이야기 주제를 선택하고,\n",
                "비슷한 술 취향을 가진\n",
                "친구와 함께 나눠요",
                "assets/svg/beer_friend_illustrator.svg"),

            // page 3
            onboardController.onboardPage(context, "\n내가 ", "직접 모임을 만들거나\n",
                "참여할 수 있어요", "assets/svg/invite_illustrator.svg"),
          ],
          animationDuration: 300,
          showSkipButton: true,
          skip: Text(
            "건너뛰기",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.grey[70]),
          ),
          onSkip: () {
            OnboardController.to.navigateOnboardToLastPage();
          },
          next: const Text(
            "다음",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primary),
          ),
          done: const Text(
            "다음",
            style: TextStyle(
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
