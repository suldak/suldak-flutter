import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../model/sign_up/sign_up_question.dart';
import '../../../model/sign_up/sign_up_selection.dart';
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            buildQuestionAnswerList(),
            // buildMyDrinkTaste(),
            // buildPreferMood(),
            // buildMySnackTaste(),
            // buildMyDrinkFlavor(),
            // buildMyDrinkCapacity(),
            // buildSaveButton(),
            const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }

  Widget buildQuestionAnswerList() {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.questionList.length,
        itemBuilder: (context, index) {
          SignUpQuestion question = controller.questionList[index];
          return buildQuestionWidget(
            title: question.qtext ?? '',
            image: Assets.png.cocktail.image(width: 18),
            tags: buildTagList(question.liquorAnswerRes),
          );
        },
      ),
    );
  }

  Widget buildMyDrinkTaste() {
    return buildQuestionWidget(
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
    return buildQuestionWidget(
      title: 'prefer_mood'.tr,
      image: Assets.png.nightBridge.image(width: 18),
      activeEveryThing: true,
      tags: List.generate(
        controller.moodTags.length,
        (index) {
          return Obx(
            () => TagWidget(
              tag: controller.moodTags[index],
              isSelected: controller.moodTagsSelection[index],
              onTap: (isSelected) {
                controller.moodTagsSelection[index] = isSelected;
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildMySnackTaste() {
    return buildQuestionWidget(
      title: 'my_snack_taste'.tr,
      image: Assets.png.pot.image(width: 18),
      activeEveryThing: true,
      tags: List.generate(
        controller.snackTags.length,
        (index) {
          return Obx(
            () => TagWidget(
              tag: controller.snackTags[index],
              isSelected: controller.snackTagsSelection[index],
              onTap: (isSelected) {
                controller.snackTagsSelection[index] = isSelected;
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildMyDrinkFlavor() {
    return buildQuestionWidget(
      title: 'prefer_alcohol_flavor'.tr,
      image: Assets.png.beer.image(width: 18),
      tags: List.generate(
        controller.flavorTags.length,
            (index) {
          return Obx(
                () => TagWidget(
              tag: controller.flavorTags[index],
              isSelected: controller.flavorTagsSelection[index],
              onTap: (isSelected) {
                controller.flavorTagsSelection[index] = isSelected;
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildMyDrinkCapacity() {
    return buildQuestionWidget(
      title: 'alcohol_capacity'.tr,
      image: Assets.png.thinkingFace.image(width: 18),
      tags: List.generate(
        controller.capacityTags.length,
            (index) {
          return Obx(
                () => TagWidget(
              tag: controller.capacityTags[index],
              isSelected: controller.capacityTagsSelection[index],
              onTap: (isSelected) {
                controller.capacityTagsSelection[index] = isSelected;
              },
            ),
          );
        },
      ),
    );
  }

  List<Widget> buildTagList(List<SignUpSelection>? selectionList) {
    return List.generate(
      selectionList?.length ?? 0,
          (index) {
        return TagWidget(
          tag: selectionList?[index].atext ?? '',
          // isSelected: controller.drinkTagsSelection[index],
          isSelected: true,
          onTap: (isSelected) {
            // controller.drinkTagsSelection[index] = isSelected;
          },
        );
        // return Obx(
        //       () => TagWidget(
        //     tag: selectionList?[index].atext ?? '',
        //     // isSelected: controller.drinkTagsSelection[index],
        //     isSelected: true,
        //     onTap: (isSelected) {
        //       // controller.drinkTagsSelection[index] = isSelected;
        //     },
        //   ),
        // );
      },
    );
  }

  Widget buildQuestionWidget({
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
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
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
          const SizedBox(height: 42),
        ],
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
