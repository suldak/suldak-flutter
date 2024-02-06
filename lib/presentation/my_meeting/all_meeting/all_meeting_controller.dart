import 'package:get/get.dart';

import '../../../config/routes.dart';
import '../../../gen/assets.gen.dart';

class AllMeetingController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  final sampleProfile = [
    Assets.sample.jerry,
    Assets.sample.pepe,
    Assets.sample.squidward,
  ];

  // Functions ▼ ------------------------------------------------------

  // 현재는 그냥 화면으로 보내주지만, 화면의 ??모임을 눌렀을 때 api를 호출해 리스트를 받아서 페이지로 전달
  // - 이미 이전 페이지에서 보여질 리스트를 로딩했기 때문에 이렇게 작성했음
  void goMeetingListPage({
    required String title,
    required List<AssetGenImage> meeting,
  }) {
    Get.toNamed(
      Routes.meetingList,
      arguments: {
        'title': title,
        'meeting': meeting,
      },
    );
  }

  // Life Cycle ▼ ------------------------------------------------------
}