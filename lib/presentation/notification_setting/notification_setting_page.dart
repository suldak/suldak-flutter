import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../widget/base_app_bar.dart';
import 'notification_setting_controller.dart';

class NotificationSettingPage extends GetView<NotificationSettingController> {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'notification_setting'.tr,
        showBackButton: true,
        showBottomLine: true,
      ),
      body: Column(
        children: [
          buildNotificationSettingItem(
            title: 'notification'.tr,
            isSelected: controller.isNotificationOn,
            desc: 'notification_desc'.tr,
          ),
          Obx(
            () => AnimatedOpacity(
              duration: Duration(
                  milliseconds: controller.isNotificationOn.value ? 450 : 300),
              curve: controller.isNotificationOn.value
                  ? Curves.easeInExpo
                  : Curves.easeInOut,
              opacity: (controller.yOffset.value + 2) * 0.5,
              child: AnimatedSlide(
                duration: Duration(
                    milliseconds:
                        controller.isNotificationOn.value ? 300 : 800),
                curve: controller.isNotificationOn.value
                    ? Curves.easeInOut
                    : Curves.easeInExpo,
                offset: Offset(0, controller.yOffset.value),
                child: Column(
                  children: [
                    buildNotificationSettingItem(
                      title: 'sound'.tr,
                      isSelected: controller.isSoundOn,
                    ),
                    buildNotificationSettingItem(
                      title: 'vibration'.tr,
                      isSelected: controller.isVibrationOn,
                    ),
                    buildNotificationSettingItem(
                      title: 'app_push'.tr,
                      isSelected: controller.isPushOn,
                      desc: 'app_push_desc'.tr,
                    ),
                    buildNotificationSettingItem(
                      title: 'marketing_info_notification'.tr,
                      isSelected: controller.isMarketingOn,
                      desc: 'marketing_info_notification_desc'.tr,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationSettingItem({
    required String title,
    required Rx<bool> isSelected,
    String? desc,
  }) {
    return Obx(
      () => Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 12, left: 20, right: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (desc != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: TextStyle(
                      color: AppColors.grey[60],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
            const Expanded(child: SizedBox()),
            CupertinoSwitch(
              value: isSelected.value,
              activeColor: AppColors.primary,
              onChanged: (bool value) {
                isSelected.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
