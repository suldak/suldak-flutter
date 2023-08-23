import 'package:get/get.dart';

import '../../config/routes.dart';

class SplashController extends GetxController {

  void navigateSplash() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Get.offAllNamed(Routes.splash);
  }

  @override
  void onInit() {
    super.onInit();

    navigateSplash();
  }
}