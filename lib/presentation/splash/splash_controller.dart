import 'package:get/get.dart';

import '../../config/routes.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void navigateSplash() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.offAllNamed(Routes.login);
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    navigateSplash();
  }
}