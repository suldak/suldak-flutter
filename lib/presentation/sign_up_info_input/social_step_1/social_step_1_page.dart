import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import '../sign_up_info_input_controller.dart';
import 'social_step_1_controller.dart';

class SocialStep1Page extends GetView<SocialStep1Controller> {

  const SocialStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => SingleChildScrollView(
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
              buildAccountWidget(),
              const SizedBox(height: 40),
              buildNicknameWidget(),
              const SizedBox(height: 100),
              buildCheckboxWidget(
                text: 'agree_all'.tr,
                showButton: false,
                value: controller.isAllAgree.value,
                onChanged: controller.onAllAgreeSelected,
              ),
              Divider(height: 1, thickness: 1, color: AppColors.grey[400]),
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
                showButton: false,
                value: controller.isAdPushAgree.value,
                onChanged: controller.onAdPushSelected,
                onPressButton: () => controller.showTermsInfoBottomSheet(''),
              ),
              const SizedBox(height: 34),
              buildNextButton(),
              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }

  /// 소셜 로그인한 계정 정보 display 위젯
  Widget buildAccountWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'email'.tr,
          style: TextStyle(
            color: AppColors.grey[500],
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
              color: AppColors.grey[400] ?? AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Obx(
                () => Text(
                  controller.email.value,
                  style: controller.textStyle,
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

  /// 닉네임 설정 text input 위젯
  Widget buildNicknameWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'nickname'.tr,
          style: TextStyle(
            color: controller.getHighlightColor(),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: controller.nickNameController,
          focusNode: controller.nicknameFocusNode,
          maxLines: 1,
          onChanged: controller.onChangeNickname,
          style: controller.textStyle,
          decoration: InputDecoration(
            border: controller.textFieldBorder,
            enabledBorder: controller.textFieldBorder,
            focusedBorder: controller.focusedTextFieldBorder,
            errorText: controller.nicknameErrorMessage.value,
            hintText: 'input_nickname'.tr,
            hintStyle: controller.hintStyle,
          ),
        ),
      ],
    );
  }

  /// 약관 동의 checkbox row 위젯
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
                      activeColor: AppColors.primary,
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
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
                    color: AppColors.grey[600],
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
                        Assets.svg.arrowNext.svg(
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            AppColors.grey[500] ?? AppColors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
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

  /// 다음 단계 버튼 위젯
  /// [isAllReqAgree] 필수약관 동의 여부 확인
  /// [isNicknameAvailable] 사용 가능 닉네임 여부 확인
  Widget buildNextButton() {
    return Obx(
      () => GestureDetector(
        onTap: controller.onTapNext,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: controller.isNextAvailable.value
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
      ),
    );
  }
}
