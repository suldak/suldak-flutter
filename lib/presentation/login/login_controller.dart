import 'package:get/get.dart';

import '../../config/routes.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void navigateSignUpInfo(bool isSocial) {
    Get.toNamed(Routes.signUpInfo, arguments: {'isSocial': isSocial});
  }

  // Life Cycle ▼ ------------------------------------------------------

}