import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/routes.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  // Variable ▼ ------------------------------------------------------
  final storage = GetStorage();

  // Functions ▼ ------------------------------------------------------

  void navigateOnboarding() async {
    var onboardKey = getBoolData('onboard');
    if (onboardKey == false) {
      await Future.delayed(const Duration(milliseconds: 3000));
      Get.offAllNamed(Routes.onboarding);
    } else {
      await Future.delayed(const Duration(milliseconds: 3000));
      Get.offAllNamed(Routes.login);
    }
  }

  bool getBoolData(String key) {
    return storage.read(key) ?? false;
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    navigateOnboarding();
  }
}
