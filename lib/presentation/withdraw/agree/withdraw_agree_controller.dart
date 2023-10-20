import 'package:get/get.dart';

import '../../../config/routes.dart';

class WithdrawAgreeController extends GetxController {
  static WithdrawAgreeController get to => Get.find();

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

  void onTapNext() {
    Get.toNamed(Routes.withdrawSurvey);
  }

  // Life Cycle ▼ ------------------------------------------------------
}