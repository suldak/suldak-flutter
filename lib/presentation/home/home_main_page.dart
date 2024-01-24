import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../widget/fab/action_button_builder.dart';
import '../../widget/fab/expandable_fab.dart';
import '../../widget/fab/fab_menu.dart';
import 'home_main_controller.dart';

class HomeMainPage extends GetView<HomeMainController> {
  const HomeMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: Obx(
        () => controller.currentTabItem.value.index == 0
            ? ExpandableFab(
                type: ExpandableFabType.up,
                distance: 76,
                overlayStyle:
                    ExpandableFabOverlayStyle(color: const Color(0x8C000000)),
                openButtonBuilder: RotateFloatingActionButtonBuilder(
                  child: const Icon(Icons.add),
                  fabSize: ExpandableFabSize.regular,
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.primary,
                  shape: const CircleBorder(),
                ),
                closeButtonBuilder: RotateFloatingActionButtonBuilder(
                  angle: 45 * pi / 180,
                  child: const Icon(Icons.add),
                  fabSize: ExpandableFabSize.regular,
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                ),
                children: const [
                  FabMenu(),
                ],
              )
            : const SizedBox(),
      ),
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
    return Expanded(
      child: Obx(
        () {
          final isSelected = item == controller.currentTabItem.value;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => controller.onTapBottomIcon(item),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                isSelected
                    ? item.selectedIcon.svg(width: 24, height: 24)
                    : item.unselectedIcon.svg(width: 24, height: 24),
                const SizedBox(height: 2),
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
        },
      ),
    );
  }
}
