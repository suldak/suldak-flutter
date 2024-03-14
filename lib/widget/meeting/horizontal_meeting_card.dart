import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../config/routes.dart';
import '../../gen/assets.gen.dart';
import '../../model/meeting.dart';
import '../circular_profile_image.dart';
import 'meeting_tag.dart';

/// ## Horizontal ListView 에서 사용하는 모임 카드 위젯
class HorizontalMeetingCard extends StatelessWidget {

  const HorizontalMeetingCard({super.key, required this.meeting});

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.meetingDetail,
        arguments: {'meetingPk': meeting.id},
      ),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MeetingTag(name: '', type: meeting.partyType),
                MeetingTag(name: meeting.tagName!),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              meeting.name!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                  child: Assets.svg.location.svg(width: 8),
                ),
                const SizedBox(height: 4),
                Text(
                  '${meeting.partyPlace} | ${meeting.getFormattedMeetingTime()}',
                  style: TextStyle(
                    color: AppColors.grey[600],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                SizedBox(
                  height: 34,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: meeting.partyGuestList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final member = meeting.partyGuestList?[index];
                      return Align(
                        widthFactor: 0.8,
                        child: CircularProfileImage(
                          size: 34,
                          isHighlighted: member?.guestPriKey == member?.hostPriKey,
                          imageUrl: member?.getGuestFileUrl(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Row(
                  children: [
                    Assets.png.group.image(width: 14),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: meeting.confirmCnt.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '/${meeting.personnel}',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey[600],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}