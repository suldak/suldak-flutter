import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel onboardPage1(BuildContext context) {
  return PageViewModel(
    // Title: 지금 나에게 딱맞는 술을 추천받을 수 있어요
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
            TextSpan(text: "지금 나에게 "),
            TextSpan(
              text: "딱맞는 술",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: "을\n추천받을 수 있어요")
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
            'assets/svg/beer_illustrator.svg',
            width: 188,
            height: 161,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
