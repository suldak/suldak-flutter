import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/colors.dart';
import 'config/pages.dart';
import 'config/routes.dart';
import 'global_controller.dart';
import 'language.dart';
import 'repository/auth_repo.dart';
import 'repository/liquor_repo.dart';
import 'repository/tag_repo.dart';
import 'repository/block_repo.dart';
import 'repository/question_repo.dart';
import 'repository/user_repo.dart';

class MyApp extends StatelessWidget with AppPagesGenerator {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: Routes.splash,
      getPages: appPages,
      theme: _theme,
      initialBinding: _InitialBinding(),
      builder: (context, child) => MediaQuery(
        data: context.mediaQuery.copyWith(textScaleFactor: 1.0),
        child: child!,
      ),
    );
  }

  ThemeData get _theme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    primaryColor: AppColors.primary,
    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      elevation: 0,
    )),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    fontFamily: 'Pretendard',
  );
}

/// ## App 시작시 사용되는 binding.
/// 전역 controller로 사용되는 [GlobalController]와 각 api 호출에 사용되는
/// repository 들을 [GetxService] 로서 바인딩한다.
class _InitialBinding extends Bindings {
  @override
  void dependencies() {
    // bind global controller
    Get.put(GlobalController());
    // 각 레포들은 get service 로서 memory 에 injection.
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => TagRepository());
    // Get.lazyPut(() => CouponRepository());
    Get.lazyPut(() => QuestionRepository());
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => BlockRepository());
    Get.lazyPut(() => LiquorRepository());
  }
}