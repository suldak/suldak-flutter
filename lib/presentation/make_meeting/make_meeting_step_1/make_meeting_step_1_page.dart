import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/tag_widget.dart';
import 'make_meeting_step_1_controller.dart';

class MakeMeetingStep1Page extends GetView<MakeMeetingStep1Controller> {
  const MakeMeetingStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '어떤 이야기를 나누고 싶나요?',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          runSpacing: 12,
          alignment: WrapAlignment.start,
          children: buildSampleTagList(),
        ),
      ],
    );
  }

  List<Widget> buildSampleTagList() {
    List<Widget> res = [];
    for (int i = 0; i < controller.sampleSelection.length; ++i) {
      res.add(buildSampleTag(i));
    }
    return res;
  }

  Widget buildSampleTag(int index) {
    return TagWidget(
      tag: 'sample $index',
      isSelected: controller.sampleSelection[index],
      onTap: (isSelected) => controller.sampleSelection[index] =
          !controller.sampleSelection[index],
    );
  }
}
