import 'package:flutter/material.dart';

import '../config/colors.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.tag,
    required this.isSelected,
    this.onTap,
  });

  final String tag;
  final bool isSelected;
  final void Function(bool isSelected)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(!isSelected);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: isSelected
                ? AppColors.primary
                : AppColors.grey[40] ?? AppColors.grey,
          ),
          color: isSelected ? AppColors.primary[30] : Colors.white,
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: isSelected ? AppColors.primary : Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
