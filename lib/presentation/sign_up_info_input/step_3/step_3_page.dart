import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../widget/tag_widget.dart';
import 'step_3_controller.dart';

class Step3Page extends GetView<Step3Controller> {
  const Step3Page({required this.onNextPage, super.key});

  final void Function() onNextPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
    );
  }

  Widget buildMyDrinkTaste() {
    return buildTagSelectionWidget(
      title: 'my_drink_taste'.tr,
      image: Assets.png.cocktail.image(width: 18),
      activeEveryThing: true,
      tags: List.generate(
        controller.drinkTags.length,
        (index) {
          return Obx(
            () => TagWidget(
              tag: controller.drinkTags[index],
              isSelected: controller.drinkTagsSelection[index],
              onTap: (isSelected) {
                controller.drinkTagsSelection[index] = isSelected;
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildPreferMood() {
    return buildTagSelectionWidget(
      title: 'prefer_mood'.tr,
      image: Assets.png.nightBridge.image(width: 18),
      activeEveryThing: true,
      tags: [
        TagWidget(tag: '왁자지껄 회식 분위기', isSelected: false,),
        TagWidget(tag: '도란도란 조용한 분위기', isSelected: false,),
        TagWidget(tag: '감성넘치는 펍', isSelected: false,),
        TagWidget(tag: '술게임과 함께', isSelected: false,),
      ],
    );
  }

  Widget buildMySnackTaste() {
    return buildTagSelectionWidget(
      title: 'my_snack_taste'.tr,
      image: Assets.png.pot.image(width: 18),
      activeEveryThing: true,
      tags: [
        TagWidget(tag: '계속 들어가는 마른안주', isSelected: false,),
        TagWidget(tag: '새콤달콤 과일안주', isSelected: false,),
        TagWidget(tag: '해장도 함께하는 국물안주', isSelected: false,),
        TagWidget(tag: '고소+짭조름 치즈안주', isSelected: false,),
        TagWidget(tag: '바삭한 튀김안주', isSelected: false,),
      ],
    );
  }

  Widget buildMyDrinkFlavor() {
    return buildTagSelectionWidget(
      title: 'prefer_alcohol_flavor'.tr,
      image: Assets.png.beer.image(width: 18),
      tags: [
        TagWidget(tag: '술맛 나는 술', isSelected: false,),
        TagWidget(tag: '달달한 술', isSelected: false,),
        TagWidget(tag: '상큼한 술', isSelected: false,),
        TagWidget(tag: '끝맛이 깔끔한 술', isSelected: false,),
        TagWidget(tag: '여운이 오래가는 술', isSelected: false,),
        TagWidget(tag: '탄산이 들어간 술', isSelected: false,),
        TagWidget(tag: '부드러운 술', isSelected: false,),
      ],
    );
  }

  Widget buildMyDrinkCapacity() {
    return buildTagSelectionWidget(
      title: 'alcohol_capacity'.tr,
      image: Assets.png.thinkingFace.image(width: 18),
      tags: [
        TagWidget(tag: '잘 못 마셔요', isSelected: false,),
        TagWidget(tag: '반 병 ~ 1병', isSelected: false,),
        TagWidget(tag: '1병 ~ 2병', isSelected: false,),
        TagWidget(tag: '2병 이상', isSelected: false,),
        TagWidget(tag: '잘 모르겠어요', isSelected: false,),
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
      onTap: onNextPage,
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
