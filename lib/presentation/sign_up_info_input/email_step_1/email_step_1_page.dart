import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import 'email_step_1_controller.dart';

class EmailStep1Page extends GetView<EmailStep1Controller> {
  const EmailStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'step1_title'.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),
              buildEmailWidget(),
              const SizedBox(height: 40),
              buildNicknameWidget(),
              const SizedBox(height: 40),
              buildPasswordWidget(),
              const SizedBox(height: 14),
              buildPasswordCheckWidget(),
              const SizedBox(height: 56),
              buildCheckboxWidget(
                text: 'agree_all'.tr,
                showButton: false,
                value: controller.isAllAgree.value,
                onChanged: controller.onAllAgreeSelected,
              ),
              Divider(height: 1, thickness: 1, color: AppColors.grey[40]),
              const SizedBox(height: 16),
              buildCheckboxWidget(
                text: 'agree_terms'.tr,
                showButton: true,
                value: controller.isTermAgree.value,
                onChanged: controller.onTermSelected,
                onPressButton: () => controller.showTermsInfoBottomSheet(''),
              ),
              buildCheckboxWidget(
                text: 'agree_personal_info'.tr,
                showButton: true,
                value: controller.isPersonalInfoAgree.value,
                onChanged: controller.onPersonalInfoSelected,
                onPressButton: () => controller.showTermsInfoBottomSheet(''),
              ),
              buildCheckboxWidget(
                text: 'agree_ad_push'.tr,
                showButton: true,
                value: controller.isAdPushAgree.value,
                onChanged: controller.onAdPushSelected,
                onPressButton: () => controller.showTermsInfoBottomSheet(''),
              ),
              const SizedBox(height: 34),
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
          child: TextField(
            controller: controller.emailController,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration:
            InputDecoration.collapsed(hintText: 'input_email'.tr),
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
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.grey[40] ?? AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller.nicknameController,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration:
                InputDecoration.collapsed(hintText: 'input_nickname'.tr),
          ),
        ),
      ],
    );
  }

  Widget buildPasswordWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'password'.tr,
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
          child: TextField(
            controller: controller.passwordController,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration:
                InputDecoration.collapsed(hintText: 'input_nickname'.tr),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            buildPasswordRuleWidget(text: 'include_english'.tr, isPass: true),
            const SizedBox(width: 12),
            buildPasswordRuleWidget(text: 'include_number'.tr, isPass: false),
            const SizedBox(width: 12),
            buildPasswordRuleWidget(text: 'between_8_20'.tr, isPass: true),
          ],
        ),
      ],
    );
  }

  Widget buildPasswordRuleWidget({
    required String text,
    required bool isPass,
  }) {
    return Row(
      children: [
        Assets.svg.check.svg(
          colorFilter: ColorFilter.mode(
            isPass ? AppColors.primary : AppColors.grey[30] ?? AppColors.grey,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: isPass ? AppColors.primary : AppColors.grey[30],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget buildPasswordCheckWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.grey[40] ?? AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller.passwordCheckController,
        maxLines: 1,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration:
        InputDecoration.collapsed(hintText: 'input_nickname'.tr),
      ),
    );
  }

  Widget buildCheckboxWidget({
    required String text,
    required bool value,
    required bool showButton,
    required void Function(bool? value) onChanged,
    void Function()? onPressButton,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onChanged(!value),
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Checkbox(
                      value: value,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  maxLines: 2,
                  style: TextStyle(
                    color: AppColors.grey[60],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          showButton
              ? Expanded(
                  child: GestureDetector(
                    // HitTestBehavior.translucent가 없으면 expanded 된 빈 공간에는
                    // gestureDetector가 이벤트를 수신하지않음
                    behavior: HitTestBehavior.translucent,
                    onTap: onPressButton,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Assets.svg.arrowNext.svg(width: 20, height: 20),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
