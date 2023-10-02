import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/routes.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void navigateOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? onboard = prefs.getString('onboard');
    if (onboard == null) {
      await Future.delayed(const Duration(milliseconds: 3000));
      Get.offAllNamed(Routes.onboarding);
    } else {
      await Future.delayed(const Duration(milliseconds: 3000));
      Get.offAllNamed(Routes.login);
    }
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    navigateOnboarding();
  }
}
