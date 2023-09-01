import 'package:get/get.dart';

import '../../../config/routes.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void onTapProfileSetting() {
    Get.toNamed(Routes.profileSetting);
  }

  void onTapManageMyAccount() {
    Get.toNamed(Routes.accountSetting);
  }

  // Life Cycle ▼ ------------------------------------------------------
}