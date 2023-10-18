import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../global_controller.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  GlobalController globalController = GlobalController.to;

  // Functions ▼ ------------------------------------------------------

  void onTapProfileSetting() {
    Get.toNamed(Routes.profileSetting);
  }

  void onTapManageMyAccount() {
    Get.toNamed(Routes.accountSetting);
  }

  void onTapNoticeSetting() {
    Get.toNamed(Routes.noticeSetting);
  }

  void onTapBlockedUser() {
    Get.toNamed(Routes.blockedUser);
  }

  // Life Cycle ▼ ------------------------------------------------------
}