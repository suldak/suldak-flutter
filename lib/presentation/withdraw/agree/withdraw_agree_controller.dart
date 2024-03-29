import 'package:get/get.dart';

import '../../../config/routes.dart';

class WithdrawAgreeController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  Rx<bool> isWithdrawAgree = false.obs;

  // Functions ▼ ------------------------------------------------------

  void onWithdrawAgreeValueChanged(bool? value) {
    if (value == null) return;
    isWithdrawAgree.value = value;
  }

  void onTapWithdrawAgreeValueRow() {
    isWithdrawAgree.value = !isWithdrawAgree.value;
  }

  void onTapNext() async {
    final isCanceled = await Get.toNamed(Routes.withdrawSurvey);
    if (isCanceled) {
      Get.back();
    }
  }

  // Life Cycle ▼ ------------------------------------------------------
}