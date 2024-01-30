import 'package:get/get.dart';

import '../../../model/sign_up/sign_up_question.dart';
import '../../../model/sign_up/sign_up_selection.dart';
import '../../../repository/question_repo.dart';
import '../sign_up_info_input_controller.dart';

class Step3Controller extends GetxController {
  static Step3Controller get to => Get.find<Step3Controller>();

  // Variable ▼ ------------------------------------------------------

  /// 상위 페이지 컨트롤러, 사용자의 회원가입 정보 입력 객체를 가지고있음
  SignUpInfoInputController signUpInfoInputController =
      SignUpInfoInputController.to;

  RxList<SignUpQuestion> questionList = <SignUpQuestion>[].obs;

  /// 회원가입 완료 버튼 활성화 여부
  Rx<bool> activeFinish = false.obs;

  // Functions ▼ ------------------------------------------------------

  void getQuestionList() async {
    final questionData = await QuestionRepository.to.getQuestionList();
    if (questionData != null) {
      questionList.value = questionData;
    }
  }

  void onTapSelection(SignUpSelection selection) {
    selection.isSelected.value = !selection.isSelected.value;
    checkFinishActive();
  }

  void onTapSelectAll(List<SignUpSelection> selections) {
    bool isAllSelected = true;

    // check if all selected
    for (var element in selections) {
      if (!element.isSelected.value) {
        isAllSelected = false;
        break;
      }
    }

    // change value
    for (var element in selections) {
      if (isAllSelected) {
        element.isSelected.value = false;
      } else {
        element.isSelected.value = true;
      }
    }

    checkFinishActive();
  }

  void checkFinishActive() {
    for (var element in questionList) {
      if (!element.liquorAnswerRes!
          .any((element) => element.isSelected.value == true)) {
        activeFinish.value = false;
        return;
      }
    }
    activeFinish.value = true;
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    getQuestionList();

    super.onInit();
  }
}
