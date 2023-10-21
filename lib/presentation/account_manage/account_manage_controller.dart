import 'package:get/get.dart';

class AccountManageController extends GetxController {
  static AccountManageController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  /// 계정이 자체가입 계정(이메일)인지 여부
  Rx<bool> isEmail = false.obs;

  /// 비밀번호 및 비밀번호 재입력 일치 여부
  Rx<bool> isPasswordMatch = false.obs;

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      isEmail.value = true;
    }
  }
}