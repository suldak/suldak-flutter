import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/base_app_bar.dart';
import 'identity_verification_controller.dart';

class IdentityVerificationPage extends GetView<IdentityVerificationController> {
  const IdentityVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.w200,
    );

    return Scaffold(
      appBar: BaseAppBar(
        showBackButton: true,
        title: 'identity_verification'.tr,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'identity_verification_content_head'.tr,
                    textAlign: TextAlign.center,
                    style: style,
                  ),
                  Text(
                    'identity_verification_content_body'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'identity_verification_content_tail'.tr,
                    textAlign: TextAlign.center,
                    style: style,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
