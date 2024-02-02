import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../widget/base_app_bar.dart';
import 'all_meeting/all_meeting_page.dart';
import 'my_meeting_main_controller.dart';

class MyMeetingMainPage extends GetView<MyMeetingMainController> {
  const MyMeetingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'my_meeting'.tr,
        showBackButton: true,
      ),
      body: Column(
        children: [
          Obx(
            () => TabBar(
              controller: controller.tabController,
              indicatorColor: AppColors.primary,
              tabs: [
                Tab(
                  child: Text(
                    'all_meetings'.tr,
                    style: TextStyle(
                      color: controller.selectedTab.value == 0
                          ? AppColors.primary
                          : AppColors.grey[50],
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'my_record'.tr,
                    style: TextStyle(
                      color: controller.selectedTab.value == 1
                          ? AppColors.primary
                          : AppColors.grey[50],
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              children: [
                AllMeetingPage(),
                Center(child: Text('2')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
