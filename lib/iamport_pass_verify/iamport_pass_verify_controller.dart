import 'package:get/get.dart';

class IamportPassVerifyController extends GetxController {
  static IamportPassVerifyController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void onCertificationComplete(Map<String, String> result) {
    print(result);
  }

  // Life Cycle ▼ ------------------------------------------------------
}