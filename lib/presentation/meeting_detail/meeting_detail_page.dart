import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import '../../widget/base_app_bar.dart';
import '../../widget/circular_profile_image.dart';
import '../../widget/meeting/meeting_tag.dart';
import 'meeting_detail_controller.dart';

class MeetingDetailPage extends GetView<MeetingDetailController> {
  const MeetingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: '',
        showBackButton: true,
        showBottomLine: true,
        onTapMoreButton: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildMeetingTitle(),
            buildDivider(),
            buildMeetingIntro(),
            buildDivider(),
            buildMembers(),
            buildDivider(),
            buildCommentSection(),
          ],
        ),
      ),
    );
  }

  Widget buildMeetingTitle() {
    return Obx(
      () {
        final meeting = controller.meeting;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildUrlProfileImage(meeting.value?.hostUserPicture),
              const SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MeetingTag(name: '', type: meeting.value?.partyType),
                      MeetingTag(name: meeting.value?.tagName ?? ''),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    meeting.value?.name ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        '${'host'.tr} | ${meeting.value?.hostUserName ?? ''}',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.grey[60],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.grey[60],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildUrlProfileImage(String? imageUrl) {
    return Container(
      width: 90,
      height: 90,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.grey[30]!, width: 0.5),
      ),
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            )
          : Container(color: AppColors.grey),
    );
  }

  Widget buildDivider() {
    return Container(
      color: AppColors.grey[20],
      height: 10,
    );
  }

  Widget buildMeetingIntro() {
    return Obx(
      () {
        final meeting = controller.meeting;
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  buildInfoWithIcon(
                    image: Assets.svg.location,
                    info: meeting.value?.partyPlace ?? '',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '|',
                      style: TextStyle(
                        color: AppColors.grey[50],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  buildInfoWithIcon(
                    image: Assets.svg.calendar,
                    info: meeting.value?.meetingDay ?? '',
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.grey[40]!),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'introduce_meeting'.tr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      meeting.value?.introStr ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildInfoWithIcon({
    required SvgGenImage image,
    required String info,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
          child: image.svg(
            width: 12,
            colorFilter: ColorFilter.mode(
              AppColors.grey[70]!,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          info,
          style: TextStyle(
            color: AppColors.grey[70],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget buildMembers() {
    return Obx(
      () {
        final meeting = controller.meeting;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.svg.members.svg(width: 18),
                  const SizedBox(width: 4),
                  Text(
                    'participants'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: meeting.value?.confirmCnt.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '/${meeting.value?.personnel}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grey[60],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    'host_accept_member_show'.tr,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey[60],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildHorizontalMemberList(),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.grey[20],
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.svg.info.svg(
                      width: 16,
                      colorFilter: ColorFilter.mode(
                        AppColors.grey[50]!,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'community_guide_violate_report'.tr,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'visit_community_guide'.tr,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildHorizontalMemberList() {
    return SizedBox(
      height: 78,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return buildMember(
            imageUrl: '',
            nickname: 'sample',
            isHighlighted: index == 0,
          );
        },
      ),
    );
  }

  Widget buildMember({
    required String? imageUrl,
    required String nickname,
    bool isHighlighted = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProfileImage(
          size: 56,
          isHighlighted: isHighlighted,
          imageUrl: imageUrl,
        ),
        const SizedBox(height: 8),
        Text(
          nickname,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildCommentSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Assets.svg.comment.svg(width: 16),
              const SizedBox(width: 4),
              Text(
                'comment'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return buildComment(
                imageUrl:
                    'https://cdn.anime-planet.com/characters/primary/elma-miss-kobayashis-dragon-maid-1-285x400.jpg?t=1628382399',
                isHighlighted: index == 4,
                hasReply: index == 0,
              );
            },
          ),
          buildCommentEnterWidget(),
          const SizedBox(width: 18),
          buildApplyMeetingButton(),
        ],
      ),
    );
  }

  Widget buildComment({
    required String? imageUrl,
    bool isHighlighted = false,
    bool hasReply = false,
    bool isReply = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircularProfileImage(
          size: 32,
          isHighlighted: isHighlighted,
          imageUrl: imageUrl,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'nick',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'commmmmmmeeeeeeennnnnnnnnnnnnnnnnnnttttttttttttttttlllllllllllllllloooooooonnnnnnnnnnngggggggggggggg',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              if (!isReply) ...[
                const SizedBox(height: 12),
                Text(
                  'reply'.tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey[60],
                  ),
                ),
              ],
              const SizedBox(height: 12),
              if (hasReply) ...[
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return buildComment(
                      imageUrl:
                          'https://i.pinimg.com/originals/ea/0f/b0/ea0fb00b9f913a5110c157040cb313cd.jpg',
                      hasReply: false,
                      isReply: true,
                    );
                  },
                ),
              ],
            ],
          ),
        ),
        Assets.svg.moreVertical.svg(width: 3),
      ],
    );
  }

  Widget buildCommentEnterWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircularProfileImage(
            size: 32,
            isHighlighted: false,
            imageUrl: 'https://static.wikia.nocookie.net/maid-dragon/images/5/52/Kobayashi_5.png/revision/latest/scale-to-width/360?cb=20170315190544',
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey[40]!),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: 'ask_about_meeting'.tr,
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey[50],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'register'.tr,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildApplyMeetingButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            'participate'.tr,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
