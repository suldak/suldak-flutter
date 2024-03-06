import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/widget/horizontal_date_picker.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../model/meeting.dart';
import '../../../widget/logo_app_bar.dart';
import '../../../widget/meeting/horizontal_meeting_card.dart';
import '../../../widget/meeting/vertical_meeting_card.dart';
import '../../../widget/top_search_bar.dart';
import '../home_main_controller.dart';
import 'find_friend_controller.dart';

class FindFriendPage extends GetView<FindFriendController> {
  const FindFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoAppBar(),
      body: SingleChildScrollView(
        controller: HomeMainController.to.findFriendScrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const TopSearchBar(),
            const SizedBox(height: 26),
            buildTitle(
              image: Assets.png.heart.image(width: 20),
              title: 'hot_story_now'.tr,
            ),
            const SizedBox(height: 14),
            buildPopularMeetingList(),
            const SizedBox(height: 60),
            buildTitle(
              image: Assets.png.great.image(width: 20),
              title: 'recommend'.tr,
            ),
            const SizedBox(height: 14),
            buildRecommendMeetingList(),
            const SizedBox(height: 60),
            buildTitle(
              image: Assets.png.great.image(width: 20),
              title: 'new_stories'.tr,
              onMore: () {},
            ),
            const SizedBox(height: 14),
            buildNewMeetingList(),
            const SizedBox(height: 40),
            Container(
              height: 10,
              color: AppColors.grey[20],
            ),
            const SizedBox(height: 45),
            buildTitle(
              image: Assets.png.calednar.image(width: 20),
              title: 'meeting_calendar'.tr,
              onMore: () {},
            ),
            const SizedBox(height: 14),
            HorizontalDatePicker(callback: controller.getDateMeetingList),
            const SizedBox(height: 18),
            buildDateMeetingList(),
            const SizedBox(height: 40),
            buildNewMeetingButton(),
          ],
        ),
      ),
    );
  }

  Widget buildTitle({
    required Image image,
    required String title,
    Function? onMore,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          image,
          const SizedBox(width: 6),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
            ),
          ),
          if (onMore != null)...[
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () => onMore(),
              child: Row(
                children: [
                  Text(
                    'more'.tr,
                    style: TextStyle(
                      color: AppColors.grey[50],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: AppColors.grey[50],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildPopularMeetingList() {
    return SizedBox(
      height: 172,
      child: Obx(
        () {
          return ListView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: controller.popularMeetingList.length > 10
                ? 10
                : controller.popularMeetingList.length,
            itemBuilder: (context, index) {
              return HorizontalMeetingCard(
                  meeting: controller.popularMeetingList[index]);
            },
          );
        },
      ),
    );
  }

  Widget buildRecommendMeetingList() {
    return SizedBox(
      height: 172,
      child: Obx(
            () {
          return ListView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: controller.recommendMeetingList.length > 10
                ? 10
                : controller.recommendMeetingList.length,
            itemBuilder: (context, index) {
              return HorizontalMeetingCard(
                  meeting: controller.recommendMeetingList[index]);
            },
          );
        },
      ),
    );
  }

  Widget buildNewMeetingList() {
    return Obx(
      () {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.vertical,
          itemCount: controller.newMeetingList.length > 4
              ? 4
              : controller.newMeetingList.length,
          itemBuilder: (context, index) {
            final Meeting meeting = controller.newMeetingList[index];
            return VerticalMeetingCard(
              meeting: meeting,
            );
          },
        );
      },
    );
  }

  Widget buildDateMeetingList() {
    return Obx(
          () {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.vertical,
          itemCount: controller.dateMeetingList.length > 4
              ? 4
              : controller.dateMeetingList.length,
          itemBuilder: (context, index) {
            final Meeting meeting = controller.dateMeetingList[index];
            return VerticalMeetingCard(
              meeting: meeting,
            );
          },
        );
      },
    );
  }

  Widget buildNewMeetingButton() {
    return GestureDetector(
      onTap: controller.navigateMakeFriend,
      child: Container(
        height: 88,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00A7EE), Color(0xFF2864FD)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'if_no_meeting_looking_for'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'create_your_own'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Assets.png.drum.image(width: 14),
                  ],
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}