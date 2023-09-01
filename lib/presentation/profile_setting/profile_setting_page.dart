import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../gen/assets.gen.dart';
import '../../widget/base_app_bar.dart';
import '../../widget/tag_widget.dart';
import 'profile_setting_controller.dart';

class ProfileSettingPage extends GetView<ProfileSettingController> {
  const ProfileSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'profile_setting'.tr, showBackButton: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              buildMyIntro(),
              const SizedBox(height: 55),
              buildMyDrinkTaste(),
              const SizedBox(height: 44),
              buildPreferMood(),
              const SizedBox(height: 44),
              buildMySnackTaste(),
              const SizedBox(height: 40),
              buildMyDrinkFlavor(),
              const SizedBox(height: 40),
              buildMyDrinkCapacity(),
              const SizedBox(height: 40),
              buildSaveButton(),
              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMyIntro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'introduce_me'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 22),
        Stack(
          children: [
            TextField(
              maxLines: 3,
              maxLength: 100,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                counterText: '',
                hintText: 'introduce_me_hint'.tr,
                hintStyle: TextStyle(
                  color: AppColors.grey[30],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.grey[30] ?? AppColors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Text(
                '0/100자',
                style: TextStyle(
                  color: AppColors.grey[50],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildMyDrinkTaste() {
    return buildTagSelectionWidget(
      title: 'my_drink_taste'.tr,
      image: Assets.png.cocktail.image(width: 18),
      activeEveryThing: true,
      tags: [
        TagWidget(tag: '소주'),
        TagWidget(tag: '맥주'),
        TagWidget(tag: '칵테일'),
        TagWidget(tag: '하이볼'),
        TagWidget(tag: '와인'),
        TagWidget(tag: '양주'),
        TagWidget(tag: '전통주'),
      ],
    );
  }

  Widget buildPreferMood() {
    return buildTagSelectionWidget(
      title: 'prefer_mood'.tr,
      image: Assets.png.nightBridge.image(width: 18),
      activeEveryThing: true,
      tags: [
        TagWidget(tag: '왁자지껄 회식 분위기'),
        TagWidget(tag: '도란도란 조용한 분위기'),
        TagWidget(tag: '감성넘치는 펍'),
        TagWidget(tag: '술게임과 함께'),
      ],
    );
  }

  Widget buildMySnackTaste() {
    return buildTagSelectionWidget(
      title: 'my_snack_taste'.tr,
      image: Assets.png.pot.image(width: 18),
      activeEveryThing: true,
      tags: [
        TagWidget(tag: '계속 들어가는 마른안주'),
        TagWidget(tag: '새콤달콤 과일안주'),
        TagWidget(tag: '해장도 함께하는 국물안주'),
        TagWidget(tag: '고소+짭조름 치즈안주'),
        TagWidget(tag: '바삭한 튀김안주'),
      ],
    );
  }

  Widget buildMyDrinkFlavor() {
    return buildTagSelectionWidget(
      title: 'prefer_alcohol_flavor'.tr,
      image: Assets.png.beer.image(width: 18),
      tags: [
        TagWidget(tag: '술맛 나는 술'),
        TagWidget(tag: '달달한 술'),
        TagWidget(tag: '상큼한 술'),
        TagWidget(tag: '끝맛이 깔끔한 술'),
        TagWidget(tag: '여운이 오래가는 술'),
        TagWidget(tag: '탄산이 들어간 술'),
        TagWidget(tag: '부드러운 술'),
      ],
    );
  }

  Widget buildMyDrinkCapacity() {
    return buildTagSelectionWidget(
      title: 'alcohol_capacity'.tr,
      image: Assets.png.thinkingFace.image(width: 18),
      tags: [
        TagWidget(tag: '잘 못 마셔요'),
        TagWidget(tag: '반 병 ~ 1병'),
        TagWidget(tag: '1병 ~ 2병'),
        TagWidget(tag: '2병 이상'),
        TagWidget(tag: '잘 모르겠어요'),
      ],
    );
  }

  Widget buildTagSelectionWidget({
    required String title,
    required Widget image,
    required List<Widget> tags,
    bool activeEveryThing = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            image,
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          runSpacing: 12,
          alignment: WrapAlignment.start,
          children: tags,
        ),
        if (activeEveryThing) ...[
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 100,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.grey[20],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  'like_all'.tr,
                  style: TextStyle(
                    color: AppColors.grey[70],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }

  Widget buildSaveButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.grey[20],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            'save_changes'.tr,
            style: TextStyle(
              color: AppColors.grey[40],
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
