import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/config/colors.dart';
import 'package:suldak_suldak/widget/base_app_bar.dart';

import 'notify_controller.dart';
import 'notify_model.dart';

class NotifyPage extends GetView<NotifyController> {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'notify'.tr,
        showBottomLine: true,
        showBackButton: true,
      ),
      body: Obx(() => controller.getNotifyDataMap() == null
          ? const NoData()
          : const HasData()),
    );
  }
}

class NoData extends GetView<NotifyController> {
  const NoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100, // 이미지 크기 조절
            height: 100, // 이미지 크기 조절
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/png/notify.png'),
            ),
          ),
          const SizedBox(height: 32), // 이미지와 텍스트 사이 여백 조절
          Text(
            'notify_no_notification'.tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.grey[50],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 128) // 하단 부분 여백 조절
        ],
      ),
    );
  }
}

class HasData extends GetView<NotifyController> {
  const HasData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, NotifyData> notifyDataMap = HashMap();
    NotifyData data1 = NotifyData(
        type: 'Notice',
        image: 'assets/png/speaker.png',
        title: '공지사항공지공지공지사항공지공지 술닥술닥에 오신걸 환영환영',
        date: DateTime.now());
    NotifyData data2 = NotifyData(
        type: 'Push',
        image: 'assets/png/check.png',
        title: '앱 푸시 알림-마케팅',
        date: DateTime.now());
    NotifyData data3 = NotifyData(
        type: 'meet',
        image: 'assets/png/beer_small.png',
        title: '술친구(모임) 관련 알림',
        date: DateTime.now());

    notifyDataMap.addAll({
      "0": data1,
      "1": data2,
      "2": data3,
    });

    return ListView.builder(
      itemCount: notifyDataMap.length,
      itemBuilder: (BuildContext context, int index) {
        var item = notifyDataMap.values.elementAt(index);
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: CircleAvatar(
            backgroundColor: AppColors.grey[20],
            child: Image.asset(item.image),
          ),
          title: Text(
            item.title,
            style: const TextStyle(fontFamily: 'Pretendard-Bold', fontSize: 16),
          ),
          subtitle: Text(formatDate(item.date),
              style: const TextStyle(
                  fontFamily: 'Pretendard-Regular', fontSize: 12)),
        );
      },
    );
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }
}
