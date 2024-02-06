import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../widget/meeting/vertical_meeting_card.dart';
import 'all_meeting_controller.dart';

class AllMeetingPage extends GetView<AllMeetingController> {

  const AllMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...buildMeetingSection(
            title: 'meetings_i_created'.tr,
              onTap: () => controller.goMeetingListPage(
                  title: 'meetings_i_created'.tr,
                  meeting: controller.sampleProfile),
              showAddButton: true,
            emptyText: 'no_meetings_i_created'.tr
          ),
          ...buildMeetingSection(
            title: 'confirmed_meeting'.tr,
            onTap: () => controller.goMeetingListPage(
                title: 'confirmed_meeting'.tr,
                meeting: controller.sampleProfile),
            emptyText: 'no_confirmed_meeting'.tr,
            isEmpty: true,
          ),
          ...buildMeetingSection(
            title: 'waiting_meeting'.tr,
            onTap: () => controller.goMeetingListPage(
                title: 'waiting_meeting'.tr,
                meeting: controller.sampleProfile),
            emptyText: 'no_waiting_meeting'.tr,
            showDivider: false,
          ),
        ],
      ),
    );
  }

  Widget buildTitleRow({
    required String title,
    required void Function() onTap,
  }) {
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
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'more'.tr,
                  style: TextStyle(
                    color: AppColors.grey[50],
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: AppColors.grey[50],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVerticalMeetingListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (context, index) {
        return VerticalMeetingCard(
          image: controller.sampleProfile[index % 3].image(fit: BoxFit.cover),
        );
      },
    );
  }

  Widget buildNewMeeting() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.primary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_rounded,
            color: AppColors.primary,
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            'create_meeting_now'.tr,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyList({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.svg.emptyList.svg(width: 100),
          const SizedBox(height: 14),
          Text(
            text,
            style: TextStyle(
              color: AppColors.grey[60],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildMeetingSection({
    required String title,
    required void Function() onTap,
    required String emptyText,
    // sample option, check if list is empty in this function later...
    bool isEmpty = false,
    bool showAddButton = false,
    bool showDivider = true,
  }) {
    final List<Widget> list = [
      const SizedBox(height: 40),
      buildTitleRow(title: title, onTap: onTap),
      const SizedBox(height: 14),
    ];

    if (isEmpty) {
      list.add(buildEmptyList(text: emptyText));
    } else {
      list.add(buildVerticalMeetingListView());

      if (showAddButton) {
        list.add(const SizedBox(height: 4));
        list.add(buildNewMeeting());
      }

      list.add(const SizedBox(height: 40));
    }

    if (showDivider) {
      list.add(Container(height: 10, color: AppColors.grey[20]));
    }

    return list;
  }
}