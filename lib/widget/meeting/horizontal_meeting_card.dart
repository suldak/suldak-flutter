import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import 'meeting_tag.dart';

class HorizontalMeetingCard extends StatelessWidget {

  const HorizontalMeetingCard({super.key, required this.sampleList});

  final List<AssetGenImage> sampleList;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              MeetingTag(),
              MeetingTag(),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            '취준고민 상담',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
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
                '구글밋 | 8.11(금) 오후 7:00',
                style: TextStyle(
                  color: AppColors.grey[60],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 34,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Align(
                        widthFactor: 0.8,
                        child: buildProfileImage(
                          index,
                          10,
                          sampleList[index % 3].image(fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // const Expanded(child: SizedBox()),
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
              const SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProfileImage(int index, int length, Image image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: index == 0 ? Border.all(color: AppColors.primary) : null,
      ),
      child: Container(
        width: 34,
        height: 34,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey,
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              image,
              if (index == 2 && length > 2)...[
                Container(
                  color: const Color(0x80000000),
                  child: Center(
                    child: Assets.svg.more.svg(width: 16),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}