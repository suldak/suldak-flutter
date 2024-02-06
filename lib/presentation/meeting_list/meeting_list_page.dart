import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/const.dart';
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
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          clipBehavior: Clip.none,
          scrollDirection: Axis.vertical,
          itemCount: controller.meetingList.length * 4,
          itemBuilder: (context, index) {
            return VerticalMeetingCard(
              image: controller.meetingList[index % 3].image(fit: BoxFit.cover),
              status: MeetingStatus.values[index % MeetingStatus.values.length],
            );
          },
        ),
      ),
    );
  }
}
