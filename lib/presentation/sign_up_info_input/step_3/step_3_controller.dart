import 'package:get/get.dart';

import '../../../model/sign_up/sign_up_question.dart';
import '../../../repository/question_repo.dart';
import '../sign_up_info_input_controller.dart';

class Step3Controller extends GetxController {
  static Step3Controller get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  /// 상위 페이지 컨트롤러, 사용자의 회원가입 정보 입력 객체를 가지고있음
  SignUpInfoInputController signUpInfoInputController =
      SignUpInfoInputController.to;

  RxList<SignUpQuestion> questionList = <SignUpQuestion>[].obs;

  RxSet<int> selectedQuestions = <int>{}.obs;

  // Functions ▼ ------------------------------------------------------

  void getQuestionList() async {
    final questionData = await QuestionRepository.to.getQuestionList();
    if (questionData != null) {
      questionList.value = questionData;
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    getQuestionList();

    super.onInit();
  }
}
