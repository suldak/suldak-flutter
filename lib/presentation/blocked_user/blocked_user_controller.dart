import 'package:get/get.dart';

import '../../repository/block_repo.dart';

class BlockedUserController extends GetxController {
  static BlockedUserController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void getBlockedUser() async {
    final res = await BlockRepository.to.getBlockedUser();
    print(res.toString());
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    getBlockedUser();
  }
}