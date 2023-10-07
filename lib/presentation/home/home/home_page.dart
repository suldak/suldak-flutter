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
          children: [
            const SizedBox(height: 10),
            buildSearchBar(),
            const SizedBox(height: 16),
            SizedBox(
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
                        dotHeight: 8
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
}
