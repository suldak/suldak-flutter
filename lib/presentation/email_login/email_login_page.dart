import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import 'email_login_controller.dart';

class EmailLoginPage extends GetView<EmailLoginController> {
  const EmailLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey[40] ?? AppColors.grey),
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
      body: SizedBox(
        width: Get.size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
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
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                      hintText: 'E-mail',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey[50],
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      enabledBorder: textFieldBorder,
                      focusedBorder: textFieldBorder,
                      hintText: 'PW',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey[50],
                      ),
                      errorText: controller.loginErrorText.value,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            GestureDetector(
              onTap: controller.emailLogin,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primary,
                ),
                child: Center(
                  child: Text(
                    'login'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildTextButtonRow(),
            const SizedBox(height: 198),
          ],
        ),
      ),
    );
  }

  Widget buildTextButtonRow() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
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
                'find_password'.tr,
                style: TextStyle(
                  color: AppColors.grey[70],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: SizedBox(
              height: 14,
              child: VerticalDivider(
                color: AppColors.grey[50],
                thickness: 1,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
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
                'sign_up_email'.tr,
                style: TextStyle(
                  color: AppColors.grey[70],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
