import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../gen/assets.gen.dart';

class FindFriendController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  final sampleProfile = [
    Assets.sample.jerry,
    Assets.sample.pepe,
    Assets.sample.squidward,
  ];

  // Functions ▼ ------------------------------------------------------

  void navigateMakeFriend() {
    Get.toNamed(Routes.makeMeeting);
  }

  // Life Cycle ▼ ------------------------------------------------------
}