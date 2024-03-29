import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../config/colors.dart';
import '../../config/const.dart';
import '../../gen/assets.gen.dart';
import '../../model/tag.dart';
import '../../widget/tag_widget.dart';
import 'filter_controller.dart';

class FilterPage extends GetView<FilterController> {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildSection(
                      title: 'meeting_date'.tr,
                      content: buildAnimatedExpandWidget(),
                    ),
                    buildSection(
                      title: 'meeting_method'.tr,
                      // content: buildTagListWrap(),
                      content: buildTypeTagListWrap(),
                    ),
                    buildSection(
                      title: 'meeting_category'.tr,
                      content: buildTagListWrap(),
                    ),
                  ],
                ),
              ),
            ),
            buildBottomButtonRow(),
            // content
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColors.grey[200],
        ),
      ),
      title: Text(
        'filter'.tr,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, size: 24, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  Widget buildBottomButtonRow() {
    return Row(
      children: [
        buildResetButton(),
        const SizedBox(width: 14),
        Expanded(child: buildApplyButton()),
      ],
    );
  }

  Widget buildResetButton() {
    return GestureDetector(
      onTap: () => controller.onTapResetButton(),
      child: Row(
        children: [
          Assets.svg.reset.svg(width: 20),
          const SizedBox(width: 10),
          Text(
            'reset'.tr,
            style: TextStyle(
              color: AppColors.grey[500],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildApplyButton() {
    return GestureDetector(
      onTap: () => controller.onTapApplyFilter(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            'apply_filter'.tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSection({required String title, required Widget content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
        const SizedBox(height: 14),
        content,
        const SizedBox(height: 44),
      ],
    );
  }

  // ExpansionTile을 참고해서 제작
  // title 커스텀이 자유롭지 않아 내부의 애니메이션 작동 부분을 가져와 사용
  Widget buildAnimatedExpandWidget() {
    return Obx(
      () {
        final closed = !controller.isCalendarExpanded.value &&
            controller.animationController.isDismissed;
        final isExpanded = controller.isCalendarExpanded.value;
        return AnimatedBuilder(
          animation: controller.animationController,
          builder: (_, __) {
            return buildDateSelector(isExpanded);
          },
          child: !controller.isCalendarExpanded.value
              ? null
              : Offstage(
                  offstage: closed,
                  child: TickerMode(
                    enabled: !closed,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildDateSelector(isExpanded),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget buildDateSelector(bool isExpanded) {
    return Column(
      children: [
        GestureDetector(
          onTap: controller.onTapExpandCalendar,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 11,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: isExpanded ? AppColors.primary : AppColors.grey[400]!,
              ),
              color: isExpanded ? AppColors.primary[300] : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Assets.svg.calendar.svg(
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    isExpanded ? AppColors.primary : AppColors.grey[400]!,
                    BlendMode.srcIn,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Obx(
                  () => Text(
                    controller.getCalendarString(),
                    style: TextStyle(
                      color: isExpanded ? AppColors.primary : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 0.5)
                      .animate(controller.animationController),
                  child: Icon(
                    Icons.expand_more,
                    color: isExpanded ? AppColors.primary : AppColors.grey[400],
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          child: Align(
            alignment: Alignment.center,
            heightFactor: controller.heightFactor.value,
            child: SfDateRangePicker(
              controller: controller.dateRangePickerController,
              selectionMode: DateRangePickerSelectionMode.range,
              monthViewSettings: const DateRangePickerMonthViewSettings(
                showTrailingAndLeadingDates: true,
              ),
              headerStyle: const DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
              ),
              selectionTextStyle: const TextStyle(color: Colors.white),
              startRangeSelectionColor: AppColors.primary,
              endRangeSelectionColor: AppColors.primary,
              rangeSelectionColor: AppColors.primary[400],
              onSelectionChanged: (selection) =>
                  controller.onChangeDateSelection(selection.value),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTagListWrap() {
    return Obx(
      () => Wrap(
        runSpacing: 12,
        alignment: WrapAlignment.start,
        children: buildTagList(controller.meetingTagList),
      ),
    );
  }

  List<Widget> buildTagList(List<TagModel> tagList) {
    return List.generate(
      tagList.length,
      (index) {
        final tag = tagList[index];
        return Obx(
          () => TagWidget(
            tag: tag.name ?? 'no data',
            isSelected: controller.selectedTagKeyList.contains(tag.id),
            onTap: (_) => controller.onTapMeetingTagWidget(tag),
          ),
        );
      },
    );
  }

  Widget buildTypeTagListWrap() {
    return Wrap(
      runSpacing: 12,
      alignment: WrapAlignment.start,
      children: [
        Obx(
          () => TagWidget(
            tag: 'online'.tr,
            isSelected:
                controller.selectedMeetingType.value == MeetingType.onLine,
            onTap: (_) =>
                controller.selectedMeetingType.value = MeetingType.onLine,
          ),
        ),
        Obx(
          () => TagWidget(
            tag: 'offline'.tr,
            isSelected:
                controller.selectedMeetingType.value == MeetingType.offLine,
            onTap: (_) =>
                controller.selectedMeetingType.value = MeetingType.offLine,
          ),
        ),
      ],
    );
  }
}