import 'package:get/get.dart';

import 'notify_model.dart';

class NotifyController extends GetxController {
  static NotifyController get to => Get.find();

  // Variable ▼ ------------------------------------------------------
  Rx<NotifyData> notifyData = Rx<NotifyData>(
    NotifyData(
      type: 'type',
      image: 'image',
      title: 'title',
      date: DateTime.now(),
    ),
  );

  // Functions ▼ ------------------------------------------------------
  void setNotifyData(NotifyData data) {
    notifyData.value = data;
  }

  Map<String, dynamic> getNotifyDataMap() {
    final notifyDataValue = notifyData.value;
    return {
      'type': notifyDataValue.type,
      'image': notifyDataValue.image,
      'title': notifyDataValue.title,
      'date': notifyDataValue.date.toIso8601String(),
    };
  }


  // Life Cycle ▼ ------------------------------------------------------
}