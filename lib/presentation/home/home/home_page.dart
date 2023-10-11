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
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'similar_drink_recent_search'.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildHorizontalScrollDrinkList(),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'new_drinks'.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            buildHorizontalScrollDrinkList(),
            const SizedBox(height: 60),
            buildPostList(),
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
                dotHeight: 8,
              ),
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
            color: Colors.grey.withOpacity(0.6),
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

  Widget buildHorizontalScrollDrinkList() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 14,
          itemBuilder: (context, index) {
            return buildHorizontalScrollDrinkItem(
              image: Assets.jpg.beer.image(fit: BoxFit.cover),
              alc: "2.3",
              name: "예거 라들러",
              tags: ['과일맥주', '달달한', '탄산감'],
            );
          },
        ),
      ),
    );
  }

  Widget buildHorizontalScrollDrinkItem({
    required Image image,
    required String alc,
    required String name,
    required List<String> tags,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 134,
            height: 162,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.grey[20],
            ),
            clipBehavior: Clip.hardEdge,
            child: image,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ALC $alc%',
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                buildHorizontalTagList(width: 124, tags: tags),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPostList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 12),
          child: Row(
            children: [
              Text(
                'Not Decided',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'more'.tr,
                      style: TextStyle(
                        color: AppColors.grey[60],
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: AppColors.grey[60],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 240,
          padding: const EdgeInsets.only(left: 20),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: (context, index) {

            },
          ),
        ),
      ],
    );
  }

  Widget buildPostItem() {
    return Column(
      children: [
        Container(
          width: 320,
          height: 185,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.hardEdge,
        ),
      ],
    );
  }
}
