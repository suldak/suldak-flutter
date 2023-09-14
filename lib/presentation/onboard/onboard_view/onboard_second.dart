import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel onboardPage2(BuildContext context) {
  return PageViewModel(
    // Title: 이야기 주제를 선택하고, 비슷한 술 취향을 가진 친구와 함께 나눠요
    titleWidget: Container(
      padding: MediaQuery.of(context).padding * 2,
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          // 공통스타일
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
          children: [
            TextSpan(text: "이야기 주제를 선택하고,\n"),
            TextSpan(
              text: "비슷한 술 취향을 가진\n",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: "친구와 함께 나눠요")
          ],
        ),
      ),
    ),

    // 이미지 부분
    bodyWidget: Stack(
      children: [
        CircleAvatar(
          radius: 126.5,
          backgroundColor: Colors.black.withOpacity(0.8),
          child: SvgPicture.asset(
            'assets/svg/beer_friend_illustrator.svg',
            width: 198,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
