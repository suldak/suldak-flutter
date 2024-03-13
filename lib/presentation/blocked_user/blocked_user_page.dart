import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../widget/base_app_bar.dart';
import 'blocked_user_controller.dart';

class BlockedUserPage extends GetView<BlockedUserController> {
  const BlockedUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'block_manage'.tr,
        showBackButton: true,
        showBottomLine: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        itemBuilder: (context, index) {
          return buildBlockedUserItem(index: index, nickname: 'sample');
        },
      ),
    );
  }

  Widget buildBlockedUserItem({required int index, required String nickname}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: AppColors.grey,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            nickname,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 1,
                  color: AppColors.grey[400] ?? AppColors.grey,
                ),
              ),
              child: Text(
                'unblock'.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
