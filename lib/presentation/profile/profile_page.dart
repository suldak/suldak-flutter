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
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(thickness: 1, height: 1, color: Colors.grey.shade200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  buildBasicProfile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBasicProfile() {
    return Row(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        const Expanded(child: SizedBox()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('name'),
            SizedBox(
              width: 250,
              child: Row(
                children: [
                  Text('알콜도수'),
                  SizedBox(width: 10),
                  Container(),
                  Expanded(child: SizedBox()),
                  Text('50%'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
              width: 250,
              child: LinearProgressIndicator(
                value: 0.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
