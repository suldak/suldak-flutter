import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailStep1Controller extends GetxController {
  static EmailStep1Controller get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  /// 전체 동의 여부
  Rx<bool> isAllAgree = false.obs;

  /// 이용약관 동의 여부
  Rx<bool> isTermAgree = false.obs;

  /// 개인정보 처리방침 동의 여부
  Rx<bool> isPersonalInfoAgree = false.obs;

  /// 푸시 알림 동의 여부
  Rx<bool> isAdPushAgree = false.obs;

  // 비밀번호 조건 변수 -------------------------
  /// 비밀번호가 숫자를 포함하고 있는지
  Rx<bool> hasDigits = false.obs;

  /// 비밀번호가 영어를 포함하고 있는지
  Rx<bool> hasEnglish = false.obs;

  /// 비밀번호가 정해진 길이를 지키는지
  Rx<bool> hasMaxMinLength = false.obs;

  // ---------------------------------------

  // next 버튼 활성화 조건 변수 -------------------------
  /// 필수 체크박스 동의 여부
  Rx<bool> isAllReqAgree = false.obs;

  /// 이메일 사용가능 여부
  Rx<bool> isEmailAvailable = false.obs;

  /// 닉네임 사용가능 여부
  Rx<bool> isNicknameAvailable = false.obs;

  /// 비밀번호 사용가능 여부
  Rx<bool> isPasswordAvailable = false.obs;

  /// 비밀번호 확인 일치 여부
  Rx<bool> isPasswordCheckMatches = false.obs;

  // -----------------------------------------------

  String password = '';

  // Functions ▼ ------------------------------------------------------

  /// email text input 문자열 변경시 호출 함수
  void onEmailTextChanged(String text) {
    isEmailAvailable.value = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
  }

  /// nickname text input 문자열 변경시 호출 함수
  void onNickNameTextChanged(String text) {
    isNicknameAvailable.value = text.length > 3;
  }

  /// password text input 문자열 변경시 호출 함수
  void onPasswordTextChanged(String text) {
    password = text;
    bool res = isPasswordCompliant(text);
    isPasswordAvailable.value = res;
  }

  /// 비밀번호 문자열 검증 함수
  bool isPasswordCompliant(
    String password, [
    int minLength = 8,
    int maxLength = 20,
  ]) {
    if (password.isEmpty) {
      return false;
    }

    hasDigits.value = password.contains(RegExp(r'[0-9]'));
    hasEnglish.value = password.contains(RegExp(r'[A-Za-z]'));
    hasMaxMinLength.value =
        password.length > minLength && password.length < maxLength;

    return hasDigits.value & hasEnglish.value & hasMaxMinLength.value;
  }

  /// password check text input 문자열 변경시 호출 함수
  void onPasswordCheckTextChanged(String text) {
    isPasswordCheckMatches.value = password == text;
  }

  /// 모든 체크박스가 활성화되었는지 확인하는 함수
  /// [isTermAgree]값을 업데이트함
  void checkAgreementAllConfirmed() {
    if (isTermAgree.value && isPersonalInfoAgree.value) {
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

  /// 전체동의 체크박스 선택시 호출 함수
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

  /// 이용약관 동의 체크박스 선택시 호출 함수
  void onTermSelected(bool? value) {
    if (value == null) return;

    isTermAgree.value = value;
    checkAgreementAllConfirmed();
  }

  /// 개인정보처리방침 동의 체크박스 선택시 호출 함수
  void onPersonalInfoSelected(bool? value) {
    if (value == null) return;

    isPersonalInfoAgree.value = value;
    checkAgreementAllConfirmed();
  }

  /// 알림 동의 체크박스 선택시 호출 함수
  void onAdPushSelected(bool? value) {
    if (value == null) return;

    isAdPushAgree.value = value;
    checkAgreementAllConfirmed();
  }

  /// 약관등 동의 항목 내용 보여주는 bottomSheet
  void showTermsInfoBottomSheet(String type) {
    Get.bottomSheet(Container(
      height: 60,
    ));
  }

// Life Cycle ▼ ------------------------------------------------------
}
