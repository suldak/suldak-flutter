import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import '../../widget/base_app_bar.dart';
import 'meeting_apply_info_controller.dart';

class MeetingApplyInfoPage extends GetView<MeetingApplyInfoController> {

  const MeetingApplyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'participate'.tr,
        showBottomLine: true,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'meeting_apply_intro'.tr,
              style: TextStyle(
                color: AppColors.grey[900],
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 26),
            buildBulletPointText(
              text: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: AppColors.grey[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: 'meeting_apply_confirm_head'.tr),
                    TextSpan(
                      text: 'meeting_apply_confirm_body'.tr,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: 'meeting_apply_confirm_tail'.tr),
                  ],
                ),
              ),
              additional: GestureDetector(
                onTap: () => showBottomSheet(),
                  child: Row(
                    children: [
                      Assets.svg.info.svg(
                        width: 16,
                        colorFilter: ColorFilter.mode(
                          AppColors.grey[600]!,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'what_is_confirm'.tr,
                        style: TextStyle(
                          color: AppColors.grey[600],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
            ),
            const SizedBox(height: 26),
            buildBulletPointText(
              text: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: AppColors.grey[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: 'meeting_apply_confirm_state_head'.tr),
                    TextSpan(
                      text: 'meeting_apply_confirm_state_body'.tr,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: 'meeting_apply_confirm_state_tail'.tr),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 26),
            buildBulletPointText(
              text: Text(
                'meeting_apply_no_too_much'.tr,
                style: TextStyle(
                  color: AppColors.grey[900],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 26),
            buildBulletPointText(
              text: Text(
                'meeting_apply_check_guide'.tr,
                style: TextStyle(
                  color: AppColors.grey[900],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              additional: GestureDetector(
                onTap: () {},
                child: Text(
                  'community_guide'.tr,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () => controller.applyMeeting(),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'complete_apply'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }

  Widget buildBulletPointText({required Widget text, Widget? additional}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text,
              if (additional != null) ...[
                const SizedBox(height: 10),
                additional,
              ],
            ],
          ),
        ),
      ],
    );
  }

  void showBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        // height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              'host_assignment'.tr,
              style: TextStyle(
                color: AppColors.grey[900],
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            buildBulletPointText(
              text: Text(
                'host_assignment_info'.tr,
                style: TextStyle(
                  color: AppColors.grey[900],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 14),
            buildBulletPointText(
              text: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: AppColors.grey[900],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: 'host_assignment_host_head'.tr),
                    TextSpan(
                      text: 'host_assignment_host_body'.tr,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: 'host_assignment_host_tail'.tr),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            buildBulletPointText(
              text: Text(
                'host_assignment_rule'.tr,
                style: TextStyle(
                  color: AppColors.grey[900],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'assign_not_contain_privacy'.tr,
              style: TextStyle(
                color: AppColors.grey[700],
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '2_hour_rule_broke'.tr,
              style: TextStyle(
                color: AppColors.grey[700],
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}