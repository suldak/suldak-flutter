import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Obx(() => controller.currentTabItem.value.page),
      bottomNavigationBar: _bottomAppBar,
      // endDrawer: const AppDrawer(),
    );
  }

  /// 하단 앱바
  Widget get _bottomAppBar => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: AppColors.grey[20] ?? AppColors.grey, width: 1),
          ),
        ),
        child: BottomAppBar(
          height: kBottomNavigationBarHeight,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildBottomAppBarButton(item: HomeBottomItem.findFriend),
              buildBottomAppBarButton(item: HomeBottomItem.home),
              buildBottomAppBarButton(item: HomeBottomItem.myHistory),
              buildBottomAppBarButton(item: HomeBottomItem.myPage),
            ],
          ),
        ),
      );

  Widget buildBottomAppBarButton({required HomeBottomItem item}) {
    return Expanded(child: Obx(() {
      final isSelected = item == controller.currentTabItem.value;
      return GestureDetector(
        onTap: () => controller.onTapBottomIcon(item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? item.selectedIcon.svg(width: 24, height: 24)
                : item.unselectedIcon.svg(width: 24, height: 24),
            Text(
              item.pageTitle,
              style: TextStyle(
                color: isSelected ? Colors.black : AppColors.grey[50],
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }));
  }
}
