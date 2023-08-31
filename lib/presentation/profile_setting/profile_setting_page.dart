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
            bottom: 70,
          ),
          child: Column(
            children: [
              buildMyIntro(),
              const SizedBox(height: 90),
              buildMyDrinkTaste(),
              const SizedBox(height: 44),
              buildPreferMood(),
              const SizedBox(height: 44),
              buildMySnackTaste(),
              const SizedBox(height: 40),
              buildSaveButton(),
              const SizedBox(height: 70),
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
        TextField(
          maxLines: 3,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
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
        const SizedBox(height: 30),
        Row(
          children: [
            const Expanded(child: SizedBox()),
            Text(
              '0/100자',
              style: TextStyle(
                color: AppColors.grey[50],
                fontSize: 12,
                fontWeight: FontWeight.w500,
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
      tags: [
        TagWidget(tag: '소주파'),
        TagWidget(tag: '맥주파'),
        TagWidget(tag: '소맥이 진리'),
        TagWidget(tag: '와인'),
        TagWidget(tag: '칵테일'),
        TagWidget(tag: '술이라면 다 잘먹어요'),
      ],
    );
  }

  Widget buildPreferMood() {
    return buildTagSelectionWidget(
      title: 'prefer_mood'.tr,
      image: Assets.png.nightBridge.image(width: 18),
      tags: [
        TagWidget(tag: '왁자지껄 회식 분위기'),
        TagWidget(tag: '도란도란 조용한 분위기'),
        TagWidget(tag: '감성넘치는 펍'),
        TagWidget(tag: '술게임과 함께'),
        TagWidget(tag: '술과 함께라면 다 좋아요'),
      ],
    );
  }

  Widget buildMySnackTaste() {
    return buildTagSelectionWidget(
      title: 'my_snack_taste'.tr,
      image: Assets.png.pot.image(width: 18),
      tags: [
        TagWidget(tag: '안주라면 역시 마른 안주죠'),
        TagWidget(tag: '안주는 꼭 있어야 하는 강경안주파'),
      ],
    );
  }

  Widget buildTagSelectionWidget({
    required String title,
    required Widget image,
    required List<Widget> tags,
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
        )
      ],
    );
  }

  Widget buildSaveButton() {
    return GestureDetector(
      onTap: () {

      },
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
