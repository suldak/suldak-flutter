import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../gen/assets.gen.dart';

class RecommendDrinks extends StatelessWidget {
  const RecommendDrinks({
    Key? key,
    required this.paddingSize,
  }) : super(key: key);

  final double paddingSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(paddingSize, 0, paddingSize, 12),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return buildRecommendDrinksItem(
            image: Assets.jpg.soju.image(fit: BoxFit.cover),
            alc: '10~12',
            name: '소주',
            content: '새콤달콤 홍초로 간단하게 만드는 소주 칵테일',
            tags: ['편의점', '달달함', '상큼'],
          );
        },
      ),
    );
  }
}

  Widget buildRecommendDrinksItem({
    required Image image,
    required String alc,
    required String name,
    required String content,
    required List<String> tags,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: AppColors.grey,
            ),
            clipBehavior: Clip.hardEdge,
            child: image,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ALC $alc%',
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    color: AppColors.grey[70],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                buildHorizontalTagList(tags: tags),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalTagList({
    required List<String> tags,
    double? width,
  }) {
    return SizedBox(
      height: 24,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(
                width: 1,
                color: AppColors.grey[30] ?? AppColors.grey,
              ),
            ),
            child: Text(
              tags[index],
              style: TextStyle(
                color: AppColors.grey[60],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
