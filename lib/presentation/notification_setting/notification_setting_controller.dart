import 'package:get/get.dart';

class NotificationSettingController extends GetxController {
  static NotificationSettingController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  /// 전체 알림 설정 on/off 여부
  Rx<bool> isNotificationOn = true.obs;

  /// 소리 항목 on/off 여부
  Rx<bool> isSoundOn = true.obs;

  /// 진동 항목 on/off 여부
  Rx<bool> isVibrationOn = true.obs;

  /// 앱 푸시 알림 항목 on/off 여부
  Rx<bool> isPushOn = true.obs;

  /// 마케팅 정보 알림 항목 on/off 여부
  Rx<bool> isMarketingOn = false.obs;

  /// 슬라이드 애니메이션 offset
  Rx<double> yOffset = 0.0.obs;

  /// 슬라이드 애니메이션 opacity
  Rx<double> opacity = 0.0.obs;

  // Functions ▼ ------------------------------------------------------

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    isNotificationOn.listen((value) {
      if (value) {
        yOffset.value = 0.0;
        opacity.value = 1;
      } else {
        yOffset.value = -2.0;
        opacity.value = 0;
      }
    });
  }
}