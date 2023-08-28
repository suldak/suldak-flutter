import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'my_profile'.tr,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,

          ),
        ),
      ),
      body: ,
    );
  }
}