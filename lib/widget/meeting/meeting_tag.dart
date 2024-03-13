import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../config/const.dart';

class MeetingTag extends StatelessWidget {

  const MeetingTag({super.key, required this.name, this.type});

  final String name;

  final MeetingType? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: type != null
              ? type == MeetingType.offLine
                  ? AppColors.secondaryGreen
                  : AppColors.secondaryOrange
              : AppColors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: Text(
          type != null
              ? type == MeetingType.offLine
                  ? 'offline'.tr
                  : 'online'.tr
              : name,
          style: TextStyle(
            color: type != null
                ? type == MeetingType.offLine
                    ? AppColors.secondaryGreen
                    : AppColors.secondaryOrange
                : AppColors.grey[600],
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
