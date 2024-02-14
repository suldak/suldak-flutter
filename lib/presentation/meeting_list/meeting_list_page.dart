import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import '../../model/meeting.dart';
import '../../widget/base_app_bar.dart';
import '../../widget/meeting/vertical_meeting_card.dart';
import 'meeting_list_controller.dart';

class MeetingListPage extends GetView<MeetingListController> {
  const MeetingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: controller.title.value,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Obx(
          () {
            if (controller.meetingList.isEmpty) {
              return buildEmptyList(text: controller.emptyText.value);
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                clipBehavior: Clip.none,
                scrollDirection: Axis.vertical,
                itemCount: controller.meetingList.length,
                itemBuilder: (context, index) {
                  final Meeting meeting = controller.meetingList[index];
                  return VerticalMeetingCard(meeting: meeting);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildEmptyList({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
