import 'package:flutter/material.dart';

import '../../config/colors.dart';

class MeetingTag extends StatelessWidget {
  const MeetingTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: AppColors.primary[30],
        border: Border.all(
          color: AppColors.primary[70]!,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: Text(
          '오프라인',
          style: TextStyle(
            color: AppColors.primary[70],
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
