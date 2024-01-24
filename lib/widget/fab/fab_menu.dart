import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';

class FabMenu extends StatelessWidget {
  const FabMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 22, bottom: 18, left: 18, right: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 8,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildMenuItem(
            image: Assets.png.star.image(width: 16),
            title: '모임 만들기',
          ),
          const SizedBox(height: 22),
          buildMenuItem(
            image: Assets.png.blueHeart.image(width: 16),
            title: '내 모임',
          ),
          const SizedBox(height: 22),
          buildMenuItem(
            image: Assets.png.siren.image(width: 16),
            title: '신고/문의하기',
            desc: '카카오톡 문의하기로 연결됩니다',
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required Image image,
    required String title,
    String? desc,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        image,
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (desc != null) ...[
              const SizedBox(width: 4),
              Text(
                desc,
                style: TextStyle(
                  color: AppColors.grey[60],
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}