import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 18),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey[300] ?? AppColors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(999),
        color: AppColors.grey[200],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.grey[600],
            size: 14,
          ),
          const SizedBox(width: 8),
          Text(
            'search_your_drink'.tr,
            style: TextStyle(
              color: AppColors.grey[500],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}