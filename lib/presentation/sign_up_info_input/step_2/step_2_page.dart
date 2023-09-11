import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import 'step_2_controller.dart';

class Step2Page extends GetView<Step2Controller> {
  const Step2Page({required this.onNextPage, super.key});

  final void Function() onNextPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          const SizedBox(height: 60),
          buildGenderSelectWidget(),
          const SizedBox(height: 40),
          buildYearSelectWidget(),
          const Expanded(child: SizedBox()),
          buildNextButton(),
          const SizedBox(height: 42),
        ],
      ),
    );
  }

  Widget buildGenderSelectWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'gender'.tr,
          style: TextStyle(
            color: AppColors.grey[50],
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Obx(
          () => Row(
            children: [
              buildGenderSelectButton(
                text: 'male'.tr,
                isSelected: controller.isMale.value,
                onTap: controller.onSelectMale,
              ),
              const SizedBox(width: 12),
              buildGenderSelectButton(
                text: 'female'.tr,
                isSelected: controller.isFemale.value,
                onTap: controller.onSelectFemale,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGenderSelectButton({
    required String text,
    required bool isSelected,
    required void Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : (AppColors.grey[40] ?? AppColors.grey),
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.grey[50],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildYearSelectWidget() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'age'.tr,
            style: TextStyle(
              color: controller.isYearSelectorFocused.value
                  ? AppColors.primary
                  : AppColors.grey[50],
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: controller.onTapYearSelector,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                    color: controller.isYearSelectorFocused.value
                        ? AppColors.primary
                        : AppColors.grey[40] ?? AppColors.grey,
                    width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                children: [
                  Text(
                    controller.selectedYear.value.toString(),
                    style: TextStyle(
                      color: AppColors.grey[70],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Assets.svg.arrowDown.svg(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 다음 단계 버튼 위젯
  /// [isAllReqAgree] 필수약관 동의 여부 확인
  /// [isNicknameAvailable] 사용 가능 닉네임 여부 확인
  Widget buildNextButton() {
    return Obx(
      () {
        bool isActive = controller.isActive.value;
        // final isAllAgree = controller.isAllReqAgree.value;
        // final isNicknameAvailable = controller.isNicknameAvailable.value;
        //
        // bool isActive = isAllAgree && isNicknameAvailable;

        return GestureDetector(
          onTap: isActive ? onNextPage : null,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.primary
                  : AppColors.primary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'next'.tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
