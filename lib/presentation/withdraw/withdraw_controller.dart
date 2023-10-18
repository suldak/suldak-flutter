import 'package:get/get.dart';

class WithdrawController extends GetxController {
  static WithdrawController get to => Get.find();

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

  // Life Cycle ▼ ------------------------------------------------------
}