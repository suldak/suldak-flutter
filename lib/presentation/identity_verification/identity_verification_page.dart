import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import '../../widget/base_app_bar.dart';
import 'identity_verification_controller.dart';

class IdentityVerificationPage extends GetView<IdentityVerificationController> {
  const IdentityVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.w200,
    );

    return Scaffold(
      appBar: BaseAppBar(
        showBackButton: true,
        title: 'identity_verification'.tr,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'identity_verification_content_head'.tr,
                  textAlign: TextAlign.center,
                  style: style,
                ),
                Text(
                  'identity_verification_content_body'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'identity_verification_content_tail'.tr,
                  textAlign: TextAlign.center,
                  style: style,
                ),
                const SizedBox(height: 60),
                Assets.png.certification.image(height: 250),
                const SizedBox(height: 120),
              ],
            ),
          ),
          GestureDetector(
            onTap: controller.onTapVerify,
            child: Container(
              height: 60,
              width: Get.size.width,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primary,
              ),
              child: Center(
                child: Text(
                  'identity_verification'.tr,
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
    );
  }
}
