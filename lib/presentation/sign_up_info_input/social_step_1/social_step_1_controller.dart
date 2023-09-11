import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialStep1Controller extends GetxController {
  static SocialStep1Controller get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  /// 전체 동의 여부
  Rx<bool> isAllAgree = false.obs;

  /// 이용약관 동의 여부
  Rx<bool> isTermAgree = false.obs;

  /// 개인정보 처리방침 동의 여부
  Rx<bool> isPersonalInfoAgree = false.obs;

  /// 푸시 알림 동의 여부
  Rx<bool> isAdPushAgree = false.obs;

  // next 버튼 활성화 조건 변수 -------------------------
  /// 필수 체크박스 동의 여부
  Rx<bool> isAllReqAgree = false.obs;

  /// 닉네임 사용가능 여부
  Rx<bool> isNicknameAvailable = false.obs;

  // -----------------------------------------------

  /// 닉네임 입력창 활성화 여부
  Rx<bool> isNicknameInputFocused = false.obs;

  /// 닉네임 입력창 focus node
  FocusNode nicknameFocusNode = FocusNode();

  // Functions ▼ ------------------------------------------------------

  /// nickname text input 문자열 변경시 호출 함수
  void onNickNameTextChanged(String text) {
    isNicknameAvailable.value = text.length > 3;
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
    Get.bottomSheet(
      Container(
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text('terms_and_conditions'.tr),
                    const SizedBox(width: 8),
                    Text('terms_and_conditions'.tr),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Life Cycle ▼ ------------------------------------------------------

@override
  void onInit() {
    super.onInit();

    nicknameFocusNode.addListener(() {
      if (nicknameFocusNode.hasFocus) {
        isNicknameInputFocused.value = true;
      } else {
        isNicknameInputFocused.value = false;
      }
    });
  }
}
