import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';
import '../../global_controller.dart';
import '../../model/sign_up/sign_up_question.dart';
import '../../model/user.dart';
import '../../repository/auth_repo.dart';
import '../../repository/question_repo.dart';
import 'email_step_1/email_step_1_page.dart';
import 'social_step_1/social_step_1_page.dart';
import 'step_2/step_2_page.dart';
import 'step_3/step_3_controller.dart';
import 'step_3/step_3_page.dart';

class SignUpInfoInputController extends GetxController {
  static SignUpInfoInputController get to => Get.find<SignUpInfoInputController>();

  // Variable ▼ ------------------------------------------------------

  bool isSocial = true;

  String? socialToken;

  RxList<Widget> pages = <Widget>[].obs;

  final pageViewController = PageController(initialPage: 0);

  UserModel signupInfo = UserModel();

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
            Step3Controller.to.getQuestionList();
          }
          break;
        default:
          break;
      }
    } else {
      final res = await signUp();
      if (res) {
        Get.offAllNamed(
          Routes.welcome,
          arguments: {'nickname': GlobalController.to.userData!.nickname!},
        );
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
      year: signupInfo.birthdayYear!,
      gender: signupInfo.gender!,
      nickname: signupInfo.nickname!,
      registration: signupInfo.registration!,
      email: signupInfo.userEmail!,
      password: isSocial ? signupInfo.identity : signupInfo.userPw,
    );

    if (res != null && res.success!) {
      return await autoLogin();
    }
    return false;
  }

  Future<bool> autoLogin() async {
    UserModel? userData;

    if (isSocial) {
      switch (signupInfo.registration) {
        case 'GOOGLE':
          userData = await AuthRepository.to.loginWithGoogle(
            accessToken: socialToken!,
          );
          break;
        case 'KAKAO':
          userData = await AuthRepository.to.loginWithKakao(
            accessToken: socialToken!,
          );
          break;
        case 'NAVER':
          userData = await AuthRepository.to.loginWithNaver(
            accessToken: socialToken!,
          );
          break;
      }
    } else {
      userData = await AuthRepository.to.loginWithEmail(
        email: signupInfo.userEmail!,
        password: signupInfo.userPw!,
      );
    }

    if (userData != null) {
      await GlobalController.to.saveUserInfo(userData);
      return await selectUserQuestion(Step3Controller.to.questionList);
    }
    return false;
  }

  Future<bool> selectUserQuestion(List<SignUpQuestion> questionList) async {
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
      selection: selectQuestionAnswerList,
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
      final userData = Get.arguments['userData'];
      if (userData != null) {
        signupInfo = userData;
      }

      final userSocialToken = Get.arguments['socialToken'];
      if (userSocialToken != null) {
        socialToken = userSocialToken;
      }

      final isFromSocial = Get.arguments['isSocial'];
      isSocial = isFromSocial;
      if (isFromSocial) {
        pages.add(const SocialStep1Page());
      } else {
        pages.add(const EmailStep1Page());
      }
    }
    pages.add(const Step2Page());
    pages.add(const Step3Page());
  }
}
