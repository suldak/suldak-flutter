import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../../global_controller.dart';
import 'find_friend/find_friend_controller.dart';
import 'find_friend/find_friend_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class HomeMainController extends GetxController {
  static HomeMainController get to => Get.find<HomeMainController>();

  // Variable ▼ ------------------------------------------------------

  /// global controller
  final GlobalController globalController = GlobalController.to;

  /// Scaffold 의 key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// 현재 선택된 바텀 앱바 index
  final currentTabItem = HomeBottomItem.home.obs;

  /// [FindFriendController]의 scroll controller
  ScrollController findFriendScrollController = ScrollController();

  /// fab 표시 여부
  Rx<bool> isFabVisible = true.obs;

  // Functions ▼ ------------------------------------------------------

  /// 바텀 앱바에서 아이콘 클릭 이벤트
  void onTapBottomIcon(HomeBottomItem item) {
    currentTabItem.value = item;
  }

  // Life Cycle ▼ ------------------------------------------------------

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      final index = Get.arguments['initial_index'];
      currentTabItem.value = HomeBottomItem.values[index];
    }

    findFriendScrollController.addListener(() {
      if (findFriendScrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isFabVisible.value == true) {
          isFabVisible.value = false;
        }
      } else {
        if (findFriendScrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isFabVisible.value == false) {
            isFabVisible.value = true;
          }
        }
      }
    });
  }
}

/// ## 하단 메뉴 화면의 버튼 종류
enum HomeBottomItem {
  /// 친구 찾기 화면
  findFriend,
  /// 홈 화면
  home,
  /// 내 기록 화면
  myHistory,
  /// 내 정보 화면
  myPage;

  /// 선택되지 않았을 경우의 아이콘
  SvgGenImage get unselectedIcon {
    switch (this) {
      case HomeBottomItem.findFriend:
        return Assets.svg.findFriend;
      case HomeBottomItem.home:
        return Assets.svg.home;
      case HomeBottomItem.myHistory:
        return Assets.svg.myHistory;
      case HomeBottomItem.myPage:
        return Assets.svg.myPage;
    }
  }

  /// 선택된 경우의 아이콘
  SvgGenImage get selectedIcon {
    switch (this) {
      case HomeBottomItem.findFriend:
        return Assets.svg.findFriendTap;
      case HomeBottomItem.home:
        return Assets.svg.homeTap;
      case HomeBottomItem.myHistory:
        return Assets.svg.myHistoryTap;
      case HomeBottomItem.myPage:
        return Assets.svg.myPageTap;
    }
  }

  String get pageTitle {
    switch (this) {
      case HomeBottomItem.findFriend:
        return 'find_friend'.tr;
      case HomeBottomItem.home:
        return 'home'.tr;
      case HomeBottomItem.myHistory:
        return 'my_history'.tr;
      case HomeBottomItem.myPage:
        return 'my_page'.tr;
    }
  }

  /// 페이지 변경에 따른 화면 분기
  Widget get page {
    switch (this) {
      case HomeBottomItem.findFriend:
        return const FindFriendPage();
      case HomeBottomItem.home:
        return const HomePage();
      case HomeBottomItem.myHistory:
        return const SizedBox();
      case HomeBottomItem.myPage:
        return const ProfilePage();
    }
  }

  bool get isFindFriend => this == HomeBottomItem.findFriend;

  bool get isHome => this == HomeBottomItem.home;

  bool get isMyHistory => this == HomeBottomItem.myHistory;

  bool get isMyPage => this == HomeBottomItem.myPage;
}