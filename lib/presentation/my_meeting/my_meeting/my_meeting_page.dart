import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../config/const.dart';
import '../../../gen/assets.gen.dart';
import '../../../model/meeting.dart';
import '../../../widget/meeting/vertical_meeting_card.dart';
import 'my_meeting_controller.dart';

class MyMeetingPage extends GetView<MyMeetingController> {
  const MyMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (controller.sampleProfile.isNotEmpty)...[
            const SizedBox(height: 40),
            buildTitleRow(title: 'confirmed_finished_meeting'.tr),
            const SizedBox(height: 14),
            buildMyMeetingListView(),
            const SizedBox(height: 40),
          ] else...[
            buildEmptyList(),
          ],
        ],
      ),
    );
  }

  Widget buildTitleRow({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Expanded(child: SizedBox()),
          PopupMenuButton<String>(
            child: Row(
              children: [
                Assets.svg.order.svg(width: 12),
                const SizedBox(width: 4),
                Obx(
                  () => Text(
                    controller.selectedSort.value == MyMeetingSort.latest
                        ? 'order_new'.tr
                        : 'order_old'.tr,
                    style: TextStyle(
                      color: AppColors.grey[60],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            itemBuilder: (context) {
              return [
                buildPopupMenuItem(MyMeetingSort.latest),
                buildPopupMenuItem(MyMeetingSort.earliest),
              ];
            },
          ),
          const SizedBox(width: 14),
          GestureDetector(
            onTap: () => controller.onTapFilter(true),
            child: Row(
              children: [
                Assets.svg.filter.svg(width: 12),
                const SizedBox(width: 4),
                Text(
                  'filter'.tr,
                  style: TextStyle(
                    color: AppColors.grey[60],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMyMeetingListView() {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        itemCount: controller.myMeetingList.length,
        itemBuilder: (context, index) {
          final Meeting meeting = controller.myMeetingList[index];
          return VerticalMeetingCard(
            meeting: meeting,
          );
        },
      ),
    );
  }

  Widget buildEmptyList() {
    return Column(
      children: [
        const SizedBox(height: 100),
        Assets.svg.emptyList.svg(width: 100),
        const SizedBox(height: 14),
        Text(
          'no_meeting_record'.tr,
          style: TextStyle(
            color: AppColors.grey[60],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  PopupMenuItem<String> buildPopupMenuItem(MyMeetingSort sort) {
    return PopupMenuItem<String>(
      onTap: () => controller.onTapSortItem(sort),
      child: Obx(
        () {
          final bool isSelected = controller.selectedSort.value == sort;
          return Text(
            sort == MyMeetingSort.latest ? 'order_new'.tr : 'order_old'.tr,
            style: TextStyle(
              color: isSelected ? Colors.black : AppColors.grey[60],
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          );
        },
      ),
    );
  }
}