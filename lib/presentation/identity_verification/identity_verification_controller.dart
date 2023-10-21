import 'package:get/get.dart';
import 'package:suldak_suldak/config/routes.dart';

class IdentityVerificationController extends GetxController {
  static IdentityVerificationController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void onTapVerify() {
    Get.toNamed(Routes.iamportPassVerify);
  }

  // Life Cycle ▼ ------------------------------------------------------
}