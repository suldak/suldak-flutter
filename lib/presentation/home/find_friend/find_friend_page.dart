import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/widget/horizontal_date_picker.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../widget/logo_profile_app_bar.dart';
import '../../../widget/meeting/horizontal_meeting_card.dart';
import '../../../widget/meeting/vertical_meeting_card.dart';
import '../../../widget/top_search_bar.dart';
import 'find_friend_controller.dart';

class FindFriendPage extends GetView<FindFriendController> {
  const FindFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoProfileAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const TopSearchBar(),
            const SizedBox(height: 26),
            buildTitle(
              image: Assets.png.heart.image(width: 20),
              title: '지금 인기있는 이야기',
            ),
            const SizedBox(height: 14),
            buildHorizontalMeeting(),
            const SizedBox(height: 60),
            buildTitle(
              image: Assets.png.great.image(width: 20),
              title: '추천합니다!',
            ),
            const SizedBox(height: 14),
            buildHorizontalMeeting(),
            const SizedBox(height: 60),
            buildTitle(
              image: Assets.png.great.image(width: 20),
              title: '새로운 이야기',
              onMore: () {},
            ),
            const SizedBox(height: 14),
            buildVerticalMeeting(),
            const SizedBox(height: 40),
            Container(
              height: 10,
              color: AppColors.grey[20],
            ),
            const HorizontalDatePicker(),
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
                    '더보기',
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

  Widget buildHorizontalMeeting() {
    return SizedBox(
      height: 172,
      child: ListView.builder(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return HorizontalMeetingCard(sampleList: controller.sampleProfile);
        },
      ),
    );
  }

  Widget buildVerticalMeeting() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      clipBehavior: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        return VerticalMeetingCard(
          image: controller.sampleProfile[index].image(fit: BoxFit.cover),
        );
      },
    );
  }
}