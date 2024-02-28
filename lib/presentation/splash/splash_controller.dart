import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suldak_suldak/model/user.dart';

import '../../config/const.dart';
import '../../config/keys.dart';
import '../../config/routes.dart';
import '../../config/urls.dart';
import '../../global_controller.dart';
import '../../repository/base_api.dart';

class SplashController extends GetxController {

  // Variable ▼ ------------------------------------------------------
  final storage = GetStorage();

  // Functions ▼ ------------------------------------------------------

  Future<void> initializeApp() async {
    await API.initialize(AppUrls.baseUrl);
    return;
  }
  
  void navigateOnboarding() async {
    // loading delay
    await Future.delayed(const Duration(milliseconds: 3000));
    var onboardKey = getBoolData(Keys.onboardShown);

    final userData = getStringData(Keys.userData);

    if (userData != null && userData.isNotEmpty) {
      UserModel userModel = UserModel.fromJson(jsonDecode(userData));

      if (userModel.refreshToken == null) {
        GlobalController.to.clearUserInfo();
        Get.offAllNamed(Routes.login);
      } else {
        Get.offAllNamed(Routes.home);
      }
    } else {
      if (onboardKey == false) {
        Get.offAllNamed(Routes.onboarding);
      } else {
        Get.offAllNamed(Routes.login);
      }
    }
  }

  bool getBoolData(String key) {
    return storage.read(key) ?? false;
  }

  String? getStringData(String key) {
    return storage.read(key);
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onReady() async {
    super.onReady();

    await initializeApp();
    navigateOnboarding();
  }
}
