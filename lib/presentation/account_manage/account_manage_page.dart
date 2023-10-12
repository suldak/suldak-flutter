import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import '../../widget/base_app_bar.dart';
import 'account_manage_controller.dart';

class AccountManagePage extends GetView<AccountManageController> {
  const AccountManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'manage_my_account'.tr,
        showBackButton: true,
        showBottomLine: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(
            () => Column(
              children: [
                const SizedBox(height: 40),
                buildConnectedAccountWidget(),
                const SizedBox(height: 40),
                buildNicknameWidget(),
                const SizedBox(height: 40),
                if (controller.isEmail.value) ...[
                  buildPasswordResetWidget(),
                  const SizedBox(height: 40),
                ],
                buildGenderWidget(),
                const SizedBox(height: 40),
                buildAgeWidget(),
                const SizedBox(height: 150),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'save'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 42),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildConnectedAccountWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'connected_account'.tr,
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
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
        Row(
          children: [
            buildGenderSelectionButton(
              title: 'male'.tr,
              selected: true,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            buildGenderSelectionButton(
              title: 'female'.tr,
              selected: false,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPasswordResetWidget() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'reset_password'.tr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 20,
              right: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: AppColors.grey[40] ?? AppColors.grey,
              ),
            ),
            child: TextField(
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration.collapsed(
                hintText: 'input_password'.tr,
                hintStyle: TextStyle(
                  color: AppColors.grey[40],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              buildPasswordConditionCheck(text: '영문 포함', isCheck: false),
              const SizedBox(width: 12),
              buildPasswordConditionCheck(text: '숫자 포함', isCheck: true),
              const SizedBox(width: 12),
              buildPasswordConditionCheck(text: '8~20자', isCheck: false),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 20,
              right: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: controller.isPasswordMatch.value
                    ? AppColors.grey[40] ?? AppColors.grey
                    : AppColors.alertPrimary,
              ),
            ),
            child: TextField(
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration.collapsed(
                hintText: 'input_password_check'.tr,
                hintStyle: TextStyle(
                  color: AppColors.grey[40],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (!controller.isPasswordMatch.value) ...[
            const Text(
              'asasdawa',
              style: TextStyle(
                color: AppColors.alertPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildPasswordConditionCheck({
    required String text,
    required bool isCheck,
  }) {
    return Row(
      children: [
        Assets.svg.check.svg(
          width: 10,
          colorFilter: ColorFilter.mode(
            isCheck ? AppColors.primary : AppColors.grey[60] ?? AppColors.grey,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          text,
          style: TextStyle(
            color: isCheck ? AppColors.primary : AppColors.grey[60],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget buildGenderSelectionButton({
    required String title,
    required bool selected,
    required void Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: selected ? AppColors.grey[20] : Colors.white,
            border: Border.all(
              width: 1,
              color: AppColors.grey[40] ?? AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.grey[50],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAgeWidget() {
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
        DropdownDatePicker(
          showDay: false,
          showMonth: false,
          onChangedYear: (year) {},
          inputDecoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey[40] ?? AppColors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey[40] ?? AppColors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
