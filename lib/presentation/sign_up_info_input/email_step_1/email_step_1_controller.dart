import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailStep1Controller extends GetxController {
  static EmailStep1Controller get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  Rx<bool> isAllAgree = false.obs;
  Rx<bool> isTermAgree = false.obs;
  Rx<bool> isPersonalInfoAgree = false.obs;
  Rx<bool> isAdPushAgree = false.obs;

  Rx<bool> isAllReqAgree = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();

  // Functions ▼ ------------------------------------------------------

  void checkAgreementAllConfirmed() {
    if(isTermAgree.value && isPersonalInfoAgree.value) {
      isAllReqAgree.value = true;
    } else {
      isAllReqAgree.value = false;
    }
    if (isTermAgree.value && isPersonalInfoAgree.value && isAdPushAgree.value) {
      isAllAgree.value = true;
    } else {
      isAllAgree.value = false;
    }
  }

  void onAllAgreeSelected(bool? value) {
    if (value == null) return;

    isAllAgree.value = value;
    if (isAllAgree.value) {
      isTermAgree.value = true;
      isPersonalInfoAgree.value = true;
      isAdPushAgree.value = true;
      isAllReqAgree.value = true;
    } else {
      isTermAgree.value = false;
      isPersonalInfoAgree.value = false;
      isAdPushAgree.value = false;
      isAllReqAgree.value = false;
    }
  }

  void onTermSelected(bool? value) {
    if (value == null) return;

    isTermAgree.value = value;
    checkAgreementAllConfirmed();
  }

  void onPersonalInfoSelected(bool? value) {
    if (value == null) return;

    isPersonalInfoAgree.value = value;
    checkAgreementAllConfirmed();
  }

  void onAdPushSelected(bool? value) {
    if (value == null) return;

    isAdPushAgree.value = value;
    checkAgreementAllConfirmed();
  }

  void showTermsInfoBottomSheet(String type) {
    Get.bottomSheet(Container(height: 60,));
  }

  // Life Cycle ▼ ------------------------------------------------------
}