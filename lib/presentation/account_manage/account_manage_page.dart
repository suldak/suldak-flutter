import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../../config/colors.dart';
import '../../widget/base_app_bar.dart';
import 'account_manage_controller.dart';

class AccountManagePage extends GetView<AccountManageController> {
  const AccountManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'manage_my_account'.tr, showBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              buildEmailWidget(),
              const SizedBox(height: 40),
              buildNicknameWidget(),
              const SizedBox(height: 40),
              buildGenderWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'email'.tr,
          style: TextStyle(
            color: AppColors.grey[50],
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.grey[40] ?? AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Text(
                'sample@sample.com',
                style: TextStyle(
                  color: AppColors.grey[50],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(height: 24, width: 24, color: Colors.yellow),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildNicknameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'nickname'.tr,
          style: TextStyle(
            color: AppColors.grey[50],
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: AppColors.grey[40] ?? AppColors.grey,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: TextField(
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration:
                      InputDecoration.collapsed(hintText: '김술닥 (기존 닉네임)'),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                  decoration: BoxDecoration(
                      color: AppColors.grey[20],
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'duplication_check'.tr,
                    style: TextStyle(
                      color: AppColors.grey[50],
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGenderWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'nickname'.tr,
          style: TextStyle(
            color: AppColors.grey[50],
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        GroupButton(
          buttons: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.grey[40] ?? AppColors.grey,
                ),
              ),
              child: Center(
                child: Text('남성'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.grey[40] ?? AppColors.grey,
                ),
              ),
              child: Center(
                child: Text('여성'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
