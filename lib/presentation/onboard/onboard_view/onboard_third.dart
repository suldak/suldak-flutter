import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel onboardPage3(BuildContext context) {
  return PageViewModel(
    // Title: 내가 직접 모임을 만들거나 참여할 수 있어요
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
            TextSpan(text: "내가 "),
            TextSpan(
              text: "직접 모임을 만들거나\n",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: "참여할 수 있어요")
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
            'assets/svg/invite_illustrator.svg',
            width: 198,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
