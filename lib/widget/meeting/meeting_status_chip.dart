import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../config/const.dart';

class MeetingStatusChip extends StatelessWidget {
  MeetingStatusChip({super.key, required this.status});

  final MeetingStatus status;

  final Map<MeetingStatus, Color?> statusColorMap = {
    MeetingStatus.confirm: AppColors.primary,
    MeetingStatus.wait: AppColors.secondary[70],
    MeetingStatus.refuse: AppColors.grey,
    MeetingStatus.cancel: AppColors.grey[50],
    MeetingStatus.finish: AppColors.grey[50],
    MeetingStatus.waitFinish: AppColors.primary,
  };

  final Map<MeetingStatus, String> statusStringMap = {
    MeetingStatus.confirm: 'meeting_confirm'.tr,
    MeetingStatus.wait: 'meeting_wait'.tr,
    MeetingStatus.refuse: 'meeting_refuse'.tr,
    MeetingStatus.cancel: 'meeting_cancel'.tr,
    MeetingStatus.finish: 'meeting_finish'.tr,
    MeetingStatus.waitFinish: 'meeting_wait_finish'.tr,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: statusColorMap[status],
        borderRadius: BorderRadius.circular(17),
      ),
      child: Text(
        statusStringMap[status]!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
