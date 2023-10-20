import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../widget/base_app_bar.dart';
import 'withdraw_survey_controller.dart';

class WithdrawSurveyPage extends GetView<WithdrawSurveyController> {
  const WithdrawSurveyPage({super.key});

  static const textStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'withdraw'.tr,
        showBottomLine: true,
        showBackButton: true,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'withdraw_survey'.tr.replaceAll('&&', 'sample'),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),
                  buildRadioListTile(
                    title: 'withdraw_survey_no_desired_search_result'.tr,
                    value: WithdrawReason.noDesiredSearchResult,
                  ),
                  buildRadioListTile(
                    title: 'withdraw_survey_no_desired_story_group'.tr,
                    value: WithdrawReason.noDesiredStoryGroup,
                  ),
                  buildRadioListTile(
                    title: 'withdraw_survey_no_desired_region_group'.tr,
                    value: WithdrawReason.noDesiredRegionGroup,
                  ),
                  buildRadioListTile(
                    title: 'withdraw_survey_unpleasant_user'.tr,
                    value: WithdrawReason.unpleasantUser,
                  ),
                  buildRadioListTile(
                    title: 'withdraw_survey_uncomfortable_service'.tr,
                    value: WithdrawReason.uncomfortableService,
                  ),
                  buildRadioListTile(
                    title: 'withdraw_survey_no_desired_function'.tr,
                    value: WithdrawReason.noDesiredFunction,
                  ),
                  buildRadioListTile(
                    title: 'withdraw_survey_not_satisfied_service'.tr,
                    value: WithdrawReason.notSatisfiedService,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 144,
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      // maxLines: 10,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintMaxLines: 5,
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 20,
                        ),
                        hintText: 'withdraw_survey_complain_hint'.tr,
                        hintStyle: TextStyle(
                          color: AppColors.grey[50],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.grey[40] ?? AppColors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: AppColors.primary,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 52),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: AppColors.primary),
                        ),
                      ),
                      child: Text(
                        'withdraw_cancel'.tr,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'withdraw'.tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioListTile({
    required String title,
    required WithdrawReason value,
  }) {
    return GestureDetector(
      onTap: () => controller.onRadioValueChanged(value),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Radio<WithdrawReason>(
                value: value,
                groupValue: controller.currentSelection.value,
                onChanged: (WithdrawReason? value) {},
              ),
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: textStyle,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
