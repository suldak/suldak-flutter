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
  //
  // 리스트를 전달하는 방법이 아니라면 모임 리스트 페이지에서 불러와야하는 모든 모임 리스트(?) api를 가지고있어야함
  // api 구성이 어떻게될지 모르겠지만 고려해볼만함
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