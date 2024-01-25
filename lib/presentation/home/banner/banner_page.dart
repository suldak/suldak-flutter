import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/widget/base_app_bar.dart';

import '../../../gen/assets.gen.dart';
import 'banner_controller.dart';

class BannerPage extends GetView<BannerController> {
  const BannerPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'banner_title'.tr,
        showBackButton: true,
        showBottomLine: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return bannerItem(index: index);
        },
      ),
    );
  }

  Widget bannerItem({required int index}) {
    return Obx(
          () => Column(
        children: [
          ListTile(
            title: Text('공지사항 제목 - $index'),
            subtitle: const Text('2024.xx.xx'),
            trailing: SvgPicture.asset(
              controller.getStatusForIndex(index),
              width: 20,
              height: 20,
              color: Colors.black,
            ),
            onTap: () {
              controller.toggleImage(index);
            },
          ),
          if (controller.showDetail(index))
            bannerDetail(index: index),
        ],
      ),
    );
  }

  Widget bannerDetail({required int index}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      child: Container(
        width: 335,
        height: 252,
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(18, 30, 18, 30),
              child: Text(
                '공지사항 내용',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: Assets.svg.notification.svg(width: 100, height: 50),
            ),
          ],
        ),
      ),
    );
  }
}

