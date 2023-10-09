import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/routes.dart';
import '../../language.dart';

class OnboardController extends GetxController {
  static OnboardController get to => Get.find();

  // Variable ▼ ------------------------------------------------------
  final storage = GetStorage();
  final Languages languages = Get.put(Languages());

  // Functions ▼ ------------------------------------------------------

  void navigateOnboardToLastPage() async {
    Get.offAllNamed(
      "${Routes.onboarding}/lastpage",
    );
  }

  void saveBoolData(String key, bool value) {
    storage.write(key, value);
  }

  void navigateLogin() async {
    Get.offAllNamed(Routes.login);
  }

  // Life Cycle ▼ ------------------------------------------------------
}
