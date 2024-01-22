import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../config/routes.dart';
import '../../gen/assets.gen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String nickname = 'nickname';
    final userNickname = Get.arguments['nickname'];

    if (userNickname != null) {
      nickname = userNickname;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'welcome'.tr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$nickname${'welcome_nickname_tail'.tr}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'welcome_nickname_thanks'.tr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            Assets.svg.welcome.svg(width: 208),
            const SizedBox(height: 36),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.home, arguments: {'initial_index': 3});
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Text(
                    'go_to_my_profile'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
