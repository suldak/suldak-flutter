import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/widget/custom_cupertino_date_picker.dart';

import '../sign_up_info_input_controller.dart';

class Step2Controller extends GetxController {
  static Step2Controller get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  /// 상위 페이지 컨트롤러, 사용자의 회원가입 정보 입력 객체를 가지고있음
  SignUpInfoInputController signUpInfoInputController =
      SignUpInfoInputController.to;

  /// 남성인지 여부, 초기 화면에서 아무것도 선택되지 않은 UI 구현을 위해 2개 변수 구성
  Rx<bool> isMale = false.obs;

  /// 여성인지 여부, 초기 화면에서 아무것도 선택되지 않은 UI 구현을 위해 2개 변수 구성
  Rx<bool> isFemale = false.obs;

  /// 다음 페이지로 넘어갈 수 있는지 여부
  Rx<bool> isActive = false.obs;

  /// 연도 선택 위젯 포커스 여부
  Rx<bool> isYearSelectorFocused = false.obs;

  /// 선택된 년도
  Rx<int> selectedYear = 1995.obs;

  // Functions ▼ ------------------------------------------------------

  /// 남성 성별 선택
  void onSelectMale() {
    isMale.value = true;
    isFemale.value = !isMale.value;

    isActive.value = isMale.value ^ isFemale.value;
  }

  /// 여성 성별 선택
  void onSelectFemale() {
    isFemale.value = true;
    isMale.value = !isFemale.value;

    isActive.value = isMale.value ^ isFemale.value;
  }

  /// 연도 선택 bottom sheet 표시
  void onTapYearSelector() async {
    isYearSelectorFocused.value = true;

    await Get.bottomSheet(
      Container(
        color: Colors.white,
        height: 300,
        child: CustomCupertinoDatePicker(
          showMonth: false,
          showDay: false,
          itemExtent: 40,
          selectedDate: DateTime(selectedYear.value),
          onSelectedItemChanged: (date) {
            selectedYear.value = date.year;
          },
        ),
      ),
    );

    isYearSelectorFocused.value = false;
  }

  void onComplete() {
    signUpInfoInputController.signupInfo.gender = isMale.value ? 'M' : 'F';
    signUpInfoInputController.signupInfo.birthdayYear = selectedYear.value;
  }

  // Life Cycle ▼ ------------------------------------------------------
}
