import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../config/const.dart';

class MeetingStatusChip extends StatelessWidget {
  MeetingStatusChip({super.key, required this.type});

  final MeetingGuestType type;

  final Map<MeetingGuestType, Color?> statusColorMap = {
    MeetingGuestType.confirm: AppColors.primary,
    MeetingGuestType.wait: AppColors.secondary[70],
    MeetingGuestType.refuse: AppColors.grey,
    MeetingGuestType.cancel: AppColors.grey[50],
    MeetingGuestType.complete: AppColors.grey[50],
    MeetingGuestType.completeWait: AppColors.primary,
  };

  final Map<MeetingGuestType, String> statusStringMap = {
    MeetingGuestType.confirm: 'meeting_confirm'.tr,
    MeetingGuestType.wait: 'meeting_wait'.tr,
    MeetingGuestType.refuse: 'meeting_refuse'.tr,
    MeetingGuestType.cancel: 'meeting_cancel'.tr,
    MeetingGuestType.complete: 'meeting_finish'.tr,
    MeetingGuestType.completeWait: 'meeting_wait_finish'.tr,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: statusColorMap[type],
        borderRadius: BorderRadius.circular(17),
      ),
      child: Text(
        statusStringMap[type]!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
