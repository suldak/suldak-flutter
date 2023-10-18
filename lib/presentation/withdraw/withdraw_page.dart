import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../widget/base_app_bar.dart';
import '../../widget/unordered_text_list.dart';
import 'withdraw_controller.dart';

class WithdrawPage extends GetView<WithdrawController> {
  const WithdrawPage({super.key});

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
        showBackButton: true,
        showBottomLine: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'withdraw_title'.tr.replaceAll('&&', 'sample'),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'withdraw_sub_title'.tr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            UnorderedTextList([
              'withdraw_warning_1'.tr,
              'withdraw_warning_2'.tr,
              'withdraw_warning_3'.tr,
            ]),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "• ",
                  style: textStyle,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: textStyle,
                      children: [
                        TextSpan(text: 'withdraw_warning_4_head'.tr),
                        TextSpan(
                          text: 'withdraw_warning_4_body'.tr,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(text: 'withdraw_warning_4_tail'.tr),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: controller.onTapWithdrawAgreeValueRow,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Obx(
                      () => SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: controller.isWithdrawAgree.value,
                          onChanged: controller.onWithdrawAgreeValueChanged,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'withdraw_agree'.tr,
                      style: TextStyle(
                        color: AppColors.grey[60],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => GestureDetector(
                onTap: controller.isWithdrawAgree.value
                    ? () {
                        print('object');
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: controller.isWithdrawAgree.value
                        ? AppColors.primary
                        : const Color(0x8027B1C6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 60,
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
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
