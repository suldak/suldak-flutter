import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../sign_up_info_input_controller.dart';

class EmailStep1Controller extends GetxController {
  static EmailStep1Controller get to => Get.find();

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

  // 비밀번호 조건 변수 -------------------------
  /// 비밀번호가 숫자를 포함하고 있는지
  Rx<bool> hasDigits = false.obs;

  /// 비밀번호가 영어를 포함하고 있는지
  Rx<bool> hasEnglish = false.obs;

  /// 비밀번호가 정해진 길이를 지키는지
  Rx<bool> hasMaxMinLength = false.obs;

  // ---------------------------------------

  // next 버튼 활성화 조건 변수 -------------------------
  // todo: 만약 error message가 null인지 확인하는 조건으로 사용가능하면 삭제 검토
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

  /// 이메일 입력창 focus 여부
  Rx<bool> isEmailFocused = false.obs;

  /// 닉네임 입력창 focus 여부
  Rx<bool> isNicknameFocused = false.obs;

  /// 비밀번호 입력창 focus 여부
  Rx<bool> isPasswordFocused = false.obs;

  /// 이메일 입력창 에러메세지
  Rxn<String?> emailErrorMessage = Rxn<String?>();

  /// 닉네임 입력창 에러메세지
  Rxn<String?> nicknameErrorMessage = Rxn<String?>();

  /// 비밀번호 입력창 에러메세지
  Rxn<String?> passwordErrorMessage = Rxn<String?>();

  /// 비밀번호 확인 입력창 에러메세지
  Rxn<String?> passwordCheckErrorMessage = Rxn<String?>();

  /// 이메일 text input controller
  TextEditingController emailController = TextEditingController();

  /// 닉네임 text input controller
  TextEditingController nicknameController = TextEditingController();

  /// 비밀번호 text input controller
  TextEditingController passwordController = TextEditingController();

  /// 이메일 입력창 focus node
  FocusNode emailFocusNode = FocusNode();

  /// 닉네임 입력창 focus node
  FocusNode nicknameFocusNode = FocusNode();

  /// 비밀번호 입력창 focus node
  FocusNode passwordFocusNode = FocusNode();

  /// 비밀번호 확인 입력창 focus node
  FocusNode passwordCheckFocusNode = FocusNode();

  /// 사용자 이메일 문자열
  String email = '';

  /// 사용자 닉네임 문자열
  String nickname = '';

  /// 사용자 비밀번호 문자열
  String password = '';

  /// 사용자 비밀번호 확인 문자열
  String passwordCheck = '';

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

  final InputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: AppColors.grey[40] ?? AppColors.grey),
  );

  final InputBorder focusedTextFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: AppColors.primary),
  );

  // Functions ▼ ------------------------------------------------------

  /// email text input 문자열 변경시 호출 함수
  void onEmailTextChanged(String text) {
    email = text;
    bool res = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if (res) {
      isEmailAvailable.value = true;
      emailErrorMessage.value = null;
    } else {
      isEmailAvailable.value = false;
      emailErrorMessage.value = 'enter_right_email'.tr;
    }
  }

  /// nickname text input 문자열 변경시 호출 함수
  void onNickNameTextChanged(String text) {
    nickname = text;
    bool res = text.length > 3;
    if (res) {
      isNicknameAvailable.value = true;
      nicknameErrorMessage.value = null;
    } else {
      isNicknameAvailable.value = false;
      nicknameErrorMessage.value = 'nickname_too_short'.tr;
    }
  }

  /// password text input 문자열 변경시 호출 함수
  void onPasswordTextChanged(String text) {
    password = text;
    bool res = isPasswordCompliant(text);
    if (res) {
      isPasswordAvailable.value = true;
      passwordErrorMessage.value = null;
    } else {
      isPasswordAvailable.value = false;
      passwordErrorMessage.value = 'password_not_complete'.tr;
    }
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
        password.length >= minLength && password.length <= maxLength;

    return hasDigits.value & hasEnglish.value & hasMaxMinLength.value;
  }

  /// password check text input 문자열 변경시 호출 함수
  void onPasswordCheckTextChanged(String text) {
    passwordCheck = text;
    bool res = password == passwordCheck;
    if (res) {
      isPasswordCheckMatches.value = true;
      passwordCheckErrorMessage.value = null;
    } else {
      isPasswordCheckMatches.value = false;
      passwordCheckErrorMessage.value = 'password_not_match'.tr;
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

  /// 사용자가 정보 입력을 마치고 다음페이지로 넘어가기 전 입력된 정보 저장(전달)
  void onComplete() {
    if (emailController.text.isEmpty || !isEmailAvailable.value) {
      emailFocusNode.requestFocus();
      return;
    }

    if (nicknameController.text.isEmpty || !isNicknameAvailable.value) {
      nicknameFocusNode.requestFocus();
      return;
    }

    if (passwordController.text.isEmpty || !isPasswordAvailable.value) {
      passwordFocusNode.requestFocus();
      return;
    }

    if (password != passwordCheck) {
      passwordCheckFocusNode.requestFocus();
      return;
    }

    signUpInfoInputController.signupInfo.userEmail = email;
    signUpInfoInputController.signupInfo.nickname = nickname;
    signUpInfoInputController.signupInfo.userPw = password;
    signUpInfoInputController.signupInfo.registration = 'SULDAKSULDAK';
  }

  /// 이메일 입력 위젯 색상
  Color getEmailWidgetColor() {
    if (emailErrorMessage.value != null) {
      return Colors.red;
    }
    if (isEmailFocused.value) {
      return AppColors.primary;
    }
    return AppColors.grey[50] ?? AppColors.grey;
  }

  /// 닉네임 입력 위젯 색상
  Color getNicknameWidgetColor() {
    if (nicknameErrorMessage.value != null) {
      return Colors.red;
    }
    if (isNicknameFocused.value) {
      return AppColors.primary;
    }
    return AppColors.grey[50] ?? AppColors.grey;
  }

  /// 비밀번호 입력 위젯 색상
  Color getPasswordWidgetColor() {
    if (passwordErrorMessage.value != null) {
      return Colors.red;
    }
    if (isPasswordFocused.value) {
      return AppColors.primary;
    }
    return AppColors.grey[50] ?? AppColors.grey;
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

  @override
  void onInit() {
    super.onInit();

    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        isEmailFocused.value = true;
      } else {
        isEmailFocused.value = false;
      }
    });

    nicknameFocusNode.addListener(() {
      if (nicknameFocusNode.hasFocus) {
        isNicknameFocused.value = true;
      } else {
        isNicknameFocused.value = false;
      }
    });

    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        isPasswordFocused.value = true;
      } else {
        isPasswordFocused.value = false;
      }
    });
  }
}
