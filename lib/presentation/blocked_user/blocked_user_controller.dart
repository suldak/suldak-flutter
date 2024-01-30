import 'dart:developer';

import 'package:get/get.dart';

import '../../repository/block_repo.dart';

class BlockedUserController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void getBlockedUser() async {
    final res = await BlockRepository.to.getBlockedUser();
    log(res.toString());
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    getBlockedUser();
  }
}