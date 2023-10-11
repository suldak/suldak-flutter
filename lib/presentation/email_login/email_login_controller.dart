import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/routes.dart';
import '../../global_controller.dart';
import '../../repository/auth_repo.dart';

class EmailLoginController extends GetxController {
  static EmailLoginController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<String?> loginErrorText = Rxn<String?>();

  // Functions ▼ ------------------------------------------------------

  void emailLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    final userData = await AuthRepository.to.loginWithEmail(email, password);
    if (userData != null) {
      await GlobalController.to.saveUserInfo(userData);
      navigateHome();
    }
  }

  void navigateSignUpInfo() {
    Get.toNamed(Routes.signUpInfo, arguments: {'isSocial': false});
  }

  void navigateHome() {
    Get.toNamed(Routes.home);
  }

  // Life Cycle ▼ ------------------------------------------------------
}