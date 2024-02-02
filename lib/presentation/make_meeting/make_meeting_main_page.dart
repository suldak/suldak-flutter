import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import 'make_meeting_main_controller.dart';

class MakeMeetingMainPage extends GetView<MakeMeetingMainController> {

  const MakeMeetingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.close,
                color: Colors.black,
                size: 24,
              ),
            ),
            const SizedBox(height: 24),
            LinearProgressIndicator(
              minHeight: 2,
              value: 0.33,
              color: Colors.black,
              backgroundColor: AppColors.grey[30],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageViewController,
                children: controller.pages,
              ),
            ),
            buildBottomButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget buildBottomButtonRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            decoration: BoxDecoration(
              color: AppColors.grey[30],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'back'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'next'.tr,
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
      ],
    );
  }
}