import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/config/colors.dart';
import 'package:suldak_suldak/widget/base_app_bar.dart';

import 'notify_controller.dart';

class NotifyPage extends GetView<NotifyController> {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'notify'.tr, showBottomLine: true, showBackButton: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100, // 이미지 크기 조절
              height: 100, // 이미지 크기 조절
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset('assets/png/notify.png'),
              ),
            ),
            const SizedBox(height: 32), // 이미지와 텍스트 사이 여백 조절
            Text('notify_no_notification'.tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.grey[50],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 128) // 하단 부분 여백 조절
          ],
        ),
      ),
    );
  }
}
