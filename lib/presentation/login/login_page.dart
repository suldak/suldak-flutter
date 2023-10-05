import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const Positioned(
                      top: 20,
                      child: Text(
                        '마음 맞는 술친구 찾기',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Assets.png.logo.image(width: 300),
                  ],
                ),
              ),
            ),
            buildSocialLoginButton(
              image: Assets.svg.kakao.svg(width: 20, height: 20),
              text: 'login_kakao'.tr,
              backgroundColor: const Color(0xFFFCEC4E),
              textColor: Colors.black,
              onTap: () {
                controller.kakaoLogin();
              },
            ),
            const SizedBox(height: 12),
            buildSocialLoginButton(
              image: Assets.svg.naver.svg(
                width: 20,
                height: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              text: 'login_naver'.tr,
              backgroundColor: const Color(0xFF56CA5D),
              textColor: Colors.white,
              onTap: () {
                controller.naverLogin();
              },
            ),
            const SizedBox(height: 12),
            buildSocialLoginButton(
              image: Assets.svg.google.svg(width: 20, height: 20),
              text: 'login_google'.tr,
              backgroundColor: const Color(0xFFF5F5F5),
              textColor: Colors.black,
              onTap: () {
                controller.googleLogin();
              },
            ),
            const SizedBox(height: 44),
            GestureDetector(
              onTap: () {
                controller.navigateEmailLogin();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColors.grey[70] ?? AppColors.grey,
                    ),
                  ),
                ),
                child: Text(
                  'login_email'.tr,
                  style: TextStyle(
                    color: AppColors.grey[70],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 72),
          ],
        ),
      ),
    );
  }

  Widget buildSocialLoginButton({
    required Widget image,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: image,
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
