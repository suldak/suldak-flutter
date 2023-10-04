import 'package:get/get.dart';

import '../../config/routes.dart';
import '../../repository/base_api.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  Future<void> initializeApp() async {
    await API.initialize('http://122.45.203.134:8080/api');
    return;
  }

  void navigateSplash() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.offAllNamed(Routes.login);
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onReady() async {
    super.onReady();

    await initializeApp();
    navigateSplash();
  }
}