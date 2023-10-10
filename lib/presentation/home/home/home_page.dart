import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            buildSearchBar(),
            const SizedBox(height: 16),
            buildBanner(),
            const SizedBox(height: 16),
            buildDrinkCategory(),
            const SizedBox(height: 40),
            buildRecommendTitle(nickname: '김술닥'),
            buildRecommendDrinks(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Assets.png.suldakTextLogo.image(),
      ),
      leadingWidth: 80,
      actions: const [
        Icon(
          Icons.notifications_none_outlined,
          color: Colors.black,
          size: 24,
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Widget buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 18),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey[30] ?? AppColors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(999),
        color: AppColors.grey[20],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.grey[60],
            size: 14,
          ),
          const SizedBox(width: 8),
          Text(
            'search_your_drink'.tr,
            style: TextStyle(
              color: AppColors.grey[50],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBanner() {
    return SizedBox(
      height: 174,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.sampleImageList.length,
            itemBuilder: (context, index) {
              return controller.sampleImageList[index];
            },
          ),
          Positioned(
            bottom: 14,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: controller.sampleImageList.length,
              effect: const ScaleEffect(
                  dotColor: Colors.white70,
                  activeDotColor: Colors.white,
                  dotWidth: 8,
                  dotHeight: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrinkCategory() {
    return SizedBox(
      height: 78,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.sampleCategoryList.length,
        itemBuilder: (context, index) {
          return buildDrinkCategoryItem(
              text: controller.sampleCategoryList[index]);
        },
      ),
    );
  }

  Widget buildDrinkCategoryItem({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.grey[20],
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecommendTitle({required String nickname}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: nickname,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: 'recommend_title_text'.tr,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecommendDrinks() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return buildRecommendDrinksItem();
        },
      ),
    );
  }

  Widget buildRecommendDrinksItem({
    required Image image,
    required String alc,
    required String name,
    required String content,
    required List<String> tags,
  }) {
    return Card(
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: AppColors.grey,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              Text('ALC $alc%'),
              const SizedBox(height: 6),
              Text(name),
              Text(content),
              const SizedBox(height: 14),
              ListView.builder(itemBuilder: (context, index) {
                return Container();
              },),
            ],
          ),
        ],
      ),
    );
  }
}
