import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/home/home_controller.dart';
import '../presentation/home/home_page.dart';
import '../presentation/login/login_controller.dart';
import '../presentation/login/login_page.dart';
import '../presentation/profile/profile_controller.dart';
import '../presentation/profile/profile_page.dart';
import '../presentation/splash/splash_controller.dart';
import '../presentation/splash/splash_page.dart';
import 'routes.dart';

mixin AppPagesGenerator on StatelessWidget {
  /// 라우팅 config. 새로운 페이지가 추가 되면 return 되는 [List]에 [GetPage]를 추가해야한다.
  List<GetPage> get appPages => [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: BindingsBuilder.put(() => SplashController()),
    ),

    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder.put(() => HomeController()),
    ),

    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),

    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      binding: BindingsBuilder.put(() => ProfileController()),
    ),
  ];
}