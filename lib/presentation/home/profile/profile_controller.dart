import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../global_controller.dart';

class ProfileController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  GlobalController globalController = GlobalController.to;

  // Functions ▼ ------------------------------------------------------

  void onTapProfileSetting() {
    Get.toNamed(Routes.profileSetting);
  }

  void onTapManageMyAccount() {
    Get.toNamed(Routes.accountSetting, arguments: {'isEmail': true});
  }

  void onTapIdentityVerification() {
    Get.toNamed(Routes.identityVerification);
  }

  void onTapNoticeSetting() {
    Get.toNamed(Routes.noticeSetting);
  }

  void onTapBlockedUser() {
    Get.toNamed(Routes.blockedUser);
  }

  void onTapWithdraw() {
    Get.toNamed(Routes.withdrawAgree);
  }

  // Life Cycle ▼ ------------------------------------------------------
}