import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import 'meeting_tag.dart';

class VerticalMeetingCard extends StatelessWidget {

  const VerticalMeetingCard({super.key, required this.image});

  final Image image;

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfileImage(image),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MeetingTag(),
                  MeetingTag(),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                '해리포터 얘기하실 분',
                style: TextStyle(
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
                    '2/3',
                    style: TextStyle(
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
}