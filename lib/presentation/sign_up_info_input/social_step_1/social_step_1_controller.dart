import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../repository/user_repo.dart';
import '../sign_up_info_input_controller.dart';

class SocialStep1Controller extends GetxController {
  static SocialStep1Controller get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  /// 상위 페이지 컨트롤러, 사용자의 회원가입 정보 입력 객체를 가지고있음
  SignUpInfoInputController signUpInfoInputController =
      SignUpInfoInputController.to;

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

  /// 닉네임 입력 에러 메세지
  Rxn<String?> nicknameErrorMessage = Rxn<String?>();

  /// 닉네임 입력 텍스트
  String nickname = '';

  /// 이메일 텍스트
  RxString email = 'sample@sample.com'.obs;

  /// 닉네임 입력창 controller
  TextEditingController nickNameController = TextEditingController();

  /// 닉네임 입력창 focus node
  FocusNode nicknameFocusNode = FocusNode();

  /// text field decoration
  final InputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: AppColors.grey[40] ?? AppColors.grey),
  );

  /// text field focused decoration
  final InputBorder focusedTextFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: AppColors.primary),
  );

  /// 공용 text field style
  final textStyle = TextStyle(
    color: AppColors.grey[50],
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  /// 공용 text field hint style
  final hintStyle = TextStyle(
    color: AppColors.grey[50],
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Functions ▼ ------------------------------------------------------

  /// nickname text input 문자열 변경시 호출 함수
  void onChangeNickname(String text) {
    nickname = text;
    // if (nickname.length > 3) {
    if (nickname.isNotEmpty) {
      isNicknameAvailable.value = true;
      nicknameErrorMessage.value = null;
    } else {
      isNicknameAvailable.value = false;
      nicknameErrorMessage.value = '닉네임이 너무 짧습니다';
    }
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

  Future<bool> checkNickname() async {
    final res = await UserRepository.to
        .checkNickname(nickname: nickNameController.text);

    final isAvailable = res?.data ?? false;

    if (!isAvailable) {
      nicknameErrorMessage.value = 'duplicated_nickname'.tr;
    } else {
      nicknameErrorMessage.value = null;
    }

    return isAvailable;
  }

  /// 사용자가 정보 입력을 마치고 다음페이지로 넘어가기 전 입력된 정보 저장(전달)
  void onComplete() {
    signUpInfoInputController.signupInfo.nickname = nickname;
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

  Color getHighlightColor() {
    if (nicknameErrorMessage.value != null) {
      return Colors.red;
    }
    if (isNicknameInputFocused.value) {
      return AppColors.primary;
    }
    return AppColors.grey[50] ?? AppColors.grey;
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

    final nickname = SignUpInfoInputController.to.signupInfo.nickname;
    if (nickname != null && nickname.isNotEmpty) {
      nickNameController.text = nickname;

      onChangeNickname(nickname);
    }

    final userEmail = SignUpInfoInputController.to.signupInfo.userEmail;
    if (userEmail != null && userEmail.isNotEmpty) {
      email.value = userEmail;
    }
  }
}
