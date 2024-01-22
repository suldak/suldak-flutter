import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/keys.dart';
import '../../config/routes.dart';
import '../../language.dart';

class OnboardController extends GetxController {

  // Variable ▼ ------------------------------------------------------
  final storage = GetStorage();
  final Languages languages = Get.put(Languages());

  // Functions ▼ ------------------------------------------------------

  void navigateOnboardToLastPage() async {
    Get.offAllNamed(Routes.onboardingLast);
  }

  void saveBoolData(String key, bool value) {
    storage.write(key, value);
  }

  void navigateLogin() async {
    Get.offAllNamed(Routes.login);
  }

  void onCompleteOnboarding() {
    saveBoolData(Keys.onboardShown, true);
    navigateLogin();
  }

  // Life Cycle ▼ ------------------------------------------------------
}
