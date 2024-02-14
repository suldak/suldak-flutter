import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import '../../model/meeting.dart';
import 'meeting_status_chip.dart';
import 'meeting_tag.dart';

/// ## Vertical ListView 에서 사용하는 모임 카드 위젯
class VerticalMeetingCard extends StatelessWidget {

  const VerticalMeetingCard({
    super.key,
    required this.meeting,
  });

  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              buildUrlProfileImage(meeting.hostUserPicture),
              const SizedBox(width: 14),
              Column(
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
                      Text(
                        '홍대입구역 | 8.11(금) 오후 7:00',
                        style: TextStyle(
                          color: AppColors.grey[60],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Assets.png.group.image(width: 14),
                      Text(
                        '${meeting.confirmCnt}/${meeting.personnel}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
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
    );
  }

  Widget buildProfileImage(Image image) {
    return Container(
      width: 70,
      height: 70,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.grey[30]!, width: 0.5),
      ),
      child: image,
    );
  }

  Widget buildUrlProfileImage(String? imageUrl) {
    return Container(
      width: 70,
      height: 70,
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
}