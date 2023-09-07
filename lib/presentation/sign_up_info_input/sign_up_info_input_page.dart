import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../config/colors.dart';
import '../../widget/base_app_bar.dart';
import 'sign_up_info_input_controller.dart';

class SignUpInfoInputPage extends GetView<SignUpInfoInputController> {
  const SignUpInfoInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const BaseAppBar(
        title: '',
        showBackButton: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 28),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SmoothPageIndicator(
                  controller: controller.pageViewController,
                  count: controller.pages.length,
                  effect: WormEffect(
                    activeDotColor: AppColors.primary,
                    dotColor: AppColors.grey[60] ?? AppColors.grey,
                    dotWidth: 8,
                    dotHeight: 8,
                    type: WormType.thin,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageViewController,
                children: controller.pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'next'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
