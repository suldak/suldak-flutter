import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import 'social_step_1_controller.dart';

class SocialStep1Page extends GetView<SocialStep1Controller> {
  const SocialStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => Column(
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
            buildAccountWidget(),
            const SizedBox(height: 40),
            buildNicknameWidget(),
            const Expanded(child: SizedBox()),
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
    );
  }

  Widget buildAccountWidget() {
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
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.grey[40] ?? AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
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
          showButton ? Expanded(
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
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
