import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../config/routes.dart';
import '../../gen/assets.gen.dart';
import '../../model/meeting.dart';
import '../circular_profile_image.dart';
import 'meeting_status_chip.dart';
import 'meeting_tag.dart';

/// ## Vertical ListView 에서 사용하는 모임 카드 위젯
class VerticalMeetingCard extends StatelessWidget {

  const VerticalMeetingCard({
    super.key,
    required this.meeting,
    this.isHighlighted = false,
  });

  final Meeting meeting;

  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.meetingDetail,
        arguments: {'meetingPk': meeting.id},
      ),
      child: Container(
        height: 124,
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
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProfileImage(
                  size: 70,
                  isHighlighted: isHighlighted,
                  imageUrl: meeting.hostUserPicture,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MeetingTag(name: '', type: meeting.partyType),
                          MeetingTag(name: meeting.tagName!),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        meeting.name!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                            child: Assets.svg.location.svg(width: 8),
                          ),
                          const SizedBox(height: 4),
                          Expanded(
                            child: Text(
                              '${meeting.partyPlace} | ${meeting.getFormattedMeetingTime()}',
                              style: TextStyle(
                                color: AppColors.grey[60],
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
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
                                    color: AppColors.grey[60],
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (meeting.guestType != null)...[
              Positioned(
                right: 0,
                child: MeetingStatusChip(type: meeting.guestType!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}