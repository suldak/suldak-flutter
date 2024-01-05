import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/model/user_signup_info.dart';

import '../../config/routes.dart';
import '../../global_controller.dart';
import '../../model/sign_up/sign_up_question.dart';
import '../../repository/auth_repo.dart';
import '../../repository/question_repo.dart';
import 'email_step_1/email_step_1_page.dart';
import 'social_step_1/social_step_1_page.dart';
import 'step_2/step_2_page.dart';
import 'step_3/step_3_controller.dart';
import 'step_3/step_3_page.dart';

class SignUpInfoInputController extends GetxController {
  static SignUpInfoInputController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  bool isSocial = true;

  RxList<Widget> pages = <Widget>[].obs;

  final pageViewController = PageController(initialPage: 0);

  final UserSignupInfo signupInfo = UserSignupInfo();

  bool isFirstPageVisited = true;

  // Functions ▼ ------------------------------------------------------

  void onNextPage() async {
    if (pages.length - 1 > (pageViewController.page?.toInt() ?? 0)) {
      pageViewController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      switch (pageViewController.page?.round()) {
        case 1:
          if (isFirstPageVisited) {
            isFirstPageVisited = false;
          } else {
            //todo call 2times when first
            Step3Controller.to.getQuestionList();
          }
          break;
        default:
          break;
      }
    } else {
      final res = await signUp();
      if (res) {
        Get.offAllNamed(Routes.welcome);
      } else {
        // todo: error handling
        // 각 단계별로 구분하려면 여기가 아닌 해당 함수에서 처히
      }
    }
  }

  void onTapBackButton() {
    if (pageViewController.page?.round() == 0) {
      Get.back();
    }
    pageViewController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  Future<bool> signUp() async {
    final res = await AuthRepository.to.signUp(
      signupInfo.birthdayYear!,
      signupInfo.gender!,
      signupInfo.nickname!,
      signupInfo.registration!,
      signupInfo.userEmail!,
      signupInfo.userPw!,
    );

    if (res != null && res.success!) {
      return await autoLogin();
    }
    return false;
  }

  Future<bool> autoLogin() async {
    final userData = await AuthRepository.to.loginWithEmail(
      signupInfo.userEmail!,
      signupInfo.userPw!,
    );

    if (userData != null) {
      await GlobalController.to.saveUserInfo(userData);
      return await selectUserQuestion(
        userData.id!,
        Step3Controller.to.questionList,
      );
    }
    return false;
  }

  Future<bool> selectUserQuestion(int userKey,
      List<SignUpQuestion> questionList) async {
    List<Map<String, dynamic>> selectQuestionAnswerList = [];

    for (final question in questionList) {
      final selectionIdList = [];

      for (final answer in question.liquorAnswerRes!) {
        if (answer.isSelected.value) {
          selectionIdList.add(answer.priKey);
        }
      }

      if (selectionIdList.isNotEmpty) {
        final map = {
          'questionPriKey': question.questionPriKey,
          'answerPriKeyList': selectionIdList,
        };
        selectQuestionAnswerList.add(map);
      }
    }

    final res = await QuestionRepository.to.setUserSelect(
      userKey,
      selectQuestionAnswerList,
    );

    if (res != null) {
      return true;
    }

    return false;
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      final isSocial = Get.arguments['isSocial'];
      if (isSocial) {
        pages.add(SocialStep1Page(onNextPage: onNextPage));
      } else {
        pages.add(EmailStep1Page(onNextPage: onNextPage));
      }
    }
    pages.add(Step2Page(onNextPage: onNextPage));
    pages.add(Step3Page(onNextPage: onNextPage));
  }
}
