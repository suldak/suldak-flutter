import 'package:get/get.dart';

import '../../../model/notify_model.dart';

class NotifyController extends GetxController {

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  RxList<NotifyData> sampleData() {
    RxList<NotifyData> notifyData = RxList<NotifyData>(
      [
        NotifyData(
            type: 'Notice',
            image: 'assets/png/speaker.png',
            title: '공지사항공지공지공지사항공지공지 술닥술닥에 오신걸 환영환영',
            date: DateTime.now()),
        NotifyData(
            type: 'Push',
            image: 'assets/png/check.png',
            title: '앱 푸시 알림-마케팅',
            date: DateTime.now()),
        NotifyData(
            type: 'meet',
            image: 'assets/png/beer_small.png',
            title: '술친구(모임) 관련 알림',
            date: DateTime.now()),
      ],
    );
    return notifyData;
  }

  // Life Cycle ▼ ------------------------------------------------------
}
