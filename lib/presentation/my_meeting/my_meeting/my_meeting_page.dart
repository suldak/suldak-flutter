import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import 'my_meeting_controller.dart';

class MyMeetingPage extends GetView<MyMeetingController> {
  const MyMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          buildTitleRow(title: 'confirmed_finished_meeting'.tr),
        ],
      ),
    );
  }

  Widget buildTitleRow({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Assets.svg.order.svg(width: 12),
                const SizedBox(width: 4),
                Text(
                  'order_new'.tr,
                  style: TextStyle(
                    color: AppColors.grey[60],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Assets.svg.filter.svg(width: 12),
                const SizedBox(width: 4),
                Text(
                  'filter'.tr,
                  style: TextStyle(
                    color: AppColors.grey[60],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}