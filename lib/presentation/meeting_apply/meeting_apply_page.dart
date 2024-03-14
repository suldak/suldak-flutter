import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../config/routes.dart';
import '../../widget/base_app_bar.dart';
import '../../widget/circular_profile_image.dart';
import 'meeting_apply_controller.dart';

class MeetingApplyPage extends GetView<MeetingApplyController> {

  const MeetingApplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'participate'.tr,
        showBackButton: true,
        showBottomLine: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'check_meeting_name'.tr,
              style: TextStyle(
                color: AppColors.grey[900],
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'check_meeting_name_content'.tr,
              style: const TextStyle(
                color: AppColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 14),
            buildMeetingInfoContainer(),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () => controller.onNext(),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(16),
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
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }

  Widget buildMeetingInfoContainer() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.grey[400] ?? AppColors.grey,
        ),
      ),
      child: Obx(
        () {
          final meeting = controller.meeting.value;
          return Column(
            children: [
              Row(
                children: [
                  CircularProfileImage(
                    size: 70,
                    isHighlighted: false,
                    imageUrl: meeting?.hostUserPicture,
                  ),
                  const SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meeting?.name ?? '',
                        style: TextStyle(
                          color: AppColors.grey[900],
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        meeting?.hostUserName ?? '',
                        style: TextStyle(
                          color: AppColors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildDatePlaceContainer(),
            ],
          );
        },
      ),
    );
  }

  Widget buildDatePlaceContainer() {
    return Obx(
      () {
        final meeting = controller.meeting.value;
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primary[50],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              buildInfoRow(
                title: 'date'.tr,
                content: meeting?.getFormattedMeetingTime() ?? '',
              ),
              const SizedBox(height: 12),
              buildInfoRow(
                title: 'place'.tr,
                content: meeting?.partyPlace ?? '',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildInfoRow({required String title, required String content}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.grey[700],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Expanded(child: SizedBox()),
        Text(
          content,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}