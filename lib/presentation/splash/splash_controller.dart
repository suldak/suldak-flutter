import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/keys.dart';
import '../../config/routes.dart';
import '../../repository/base_api.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  // Variable ▼ ------------------------------------------------------
  final storage = GetStorage();

  // Functions ▼ ------------------------------------------------------

  Future<void> initializeApp() async {
    await API.initialize('http://122.45.203.134:8080/api');
    return;
  }
  
  void navigateOnboarding() async {
    // loading delay
    await Future.delayed(const Duration(milliseconds: 3000));
    var onboardKey = getBoolData(Keys.onboardShown);

    if (onboardKey == false) {
      Get.offAllNamed(Routes.onboarding);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
  
  bool getBoolData(String key) {
    return storage.read(key) ?? false;
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onReady() async {
    super.onReady();

    await initializeApp();
    navigateOnboarding();
  }
}
