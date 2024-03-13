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

  /// 이메일 입력 text input 위젯
  Widget buildEmailWidget() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'email'.tr,
            style: TextStyle(
              color: controller.getEmailWidgetColor(),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            key: controller.emailKey,
            focusNode: controller.emailFocusNode,
            controller: controller.emailController,
            maxLines: 1,
            style: controller.textStyle,
            decoration: InputDecoration(
              border: controller.textFieldBorder,
              enabledBorder: controller.textFieldBorder,
              focusedBorder: controller.focusedTextFieldBorder,
              errorText: controller.emailErrorMessage.value,
              hintText: 'input_email'.tr,
              hintStyle: controller.hintStyle,
            ),
            onChanged: controller.onEmailTextChanged,
          ),
        ],
      ),
    );
  }

  /// 닉네임 설정 text input 위젯
  Widget buildNicknameWidget() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'nickname'.tr,
            style: TextStyle(
              color: controller.getNicknameWidgetColor(),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            key: controller.nicknameKey,
            focusNode: controller.nicknameFocusNode,
            controller: controller.nicknameController,
            maxLines: 1,
            style: controller.textStyle,
            decoration: InputDecoration(
              border: controller.textFieldBorder,
              enabledBorder: controller.textFieldBorder,
              focusedBorder: controller.focusedTextFieldBorder,
              errorText: controller.nicknameErrorMessage.value,
              hintText: 'input_nickname'.tr,
              hintStyle: controller.hintStyle,
            ),
            onChanged: controller.onNickNameTextChanged,
          ),
        ],
      ),
    );
  }

  /// 비밀번호 입력 text input 위젯
  Widget buildPasswordWidget() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'password'.tr,
            style: TextStyle(
              color: controller.getPasswordWidgetColor(),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            key: controller.passwordKey,
            focusNode: controller.passwordFocusNode,
            controller: controller.passwordController,
            maxLines: 1,
            style: controller.textStyle,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              border: controller.textFieldBorder,
              enabledBorder: controller.textFieldBorder,
              focusedBorder: controller.focusedTextFieldBorder,
              errorText: controller.passwordErrorMessage.value,
              hintText: 'input_password'.tr,
              hintStyle: controller.hintStyle
            ),
            onChanged: controller.onPasswordTextChanged,
          ),
          const SizedBox(height: 10),
          Obx(
            () => Row(
              children: [
                buildPasswordRuleWidget(
                  text: 'include_english'.tr,
                  isPass: controller.hasEnglish.value,
                ),
                const SizedBox(width: 12),
                buildPasswordRuleWidget(
                  text: 'include_number'.tr,
                  isPass: controller.hasDigits.value,
                ),
                const SizedBox(width: 12),
                buildPasswordRuleWidget(
                  text: 'between_8_20'.tr,
                  isPass: controller.hasMaxMinLength.value,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 비밀번호 입력 조건 확인 위젯
  Widget buildPasswordRuleWidget({
    required String text,
    required bool isPass,
  }) {
    return Row(
      children: [
        Assets.svg.check.svg(
          colorFilter: ColorFilter.mode(
            isPass ? AppColors.primary : AppColors.grey[300] ?? AppColors.grey,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: isPass ? AppColors.primary : AppColors.grey[300],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// 비밀번호 확인 text input 위젯
  Widget buildPasswordCheckWidget() {
    return TextField(
      key: controller.passwordCheckKey,
      focusNode: controller.passwordCheckFocusNode,
      maxLines: 1,
      style: controller.textStyle,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        border: controller.textFieldBorder,
        enabledBorder: controller.textFieldBorder,
        focusedBorder: controller.focusedTextFieldBorder,
        errorText: controller.passwordCheckErrorMessage.value,
        hintText: 'input_password_check'.tr,
        hintStyle: controller.hintStyle,
      ),
      onChanged: controller.onPasswordCheckTextChanged,
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
