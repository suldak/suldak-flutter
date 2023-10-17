import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/account_manage/account_manage_controller.dart';
import '../presentation/account_manage/account_manage_page.dart';
import '../presentation/email_login/email_login_controller.dart';
import '../presentation/email_login/email_login_page.dart';
import '../presentation/home/home_controller.dart';
import '../presentation/home/home_page.dart';
import '../presentation/home/profile/profile_controller.dart';
import '../presentation/login/login_controller.dart';
import '../presentation/login/login_page.dart';
import '../presentation/notification_setting/notification_setting_controller.dart';
import '../presentation/notification_setting/notification_setting_page.dart';
import '../presentation/onboard/onboard_controller.dart';
import '../presentation/onboard/onboard_page.dart';
import '../presentation/onboard/onboard_last_page.dart';
import '../presentation/profile_setting/profile_setting_controller.dart';
import '../presentation/profile_setting/profile_setting_page.dart';
import '../presentation/sign_up_info_input/email_step_1/email_step_1_controller.dart';
import '../presentation/sign_up_info_input/sign_up_info_input_controller.dart';
import '../presentation/sign_up_info_input/sign_up_info_input_page.dart';
import '../presentation/sign_up_info_input/social_step_1/social_step_1_controller.dart';
import '../presentation/sign_up_info_input/step_2/step_2_controller.dart';
import '../presentation/sign_up_info_input/step_3/step_3_controller.dart';
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
          name: Routes.onboarding,
          page: () => const OnboardPage(),
          binding: BindingsBuilder.put(() => OnboardController()),
        ),
        GetPage(
          name: Routes.onboardingLast,
          page: () => const OnboardLastPage(),
          transition: Transition.zoom,
          binding: BindingsBuilder.put(() => OnboardController()),
        ),
        GetPage(
          name: Routes.home,
          page: () => const HomePage(),
          binding: BindingsBuilder(() {
            Get.put(HomeController());
            Get.lazyPut(() => ProfileController());
          }),
        ),
        GetPage(
          name: Routes.login,
          page: () => const LoginPage(),
          binding: BindingsBuilder.put(() => LoginController()),
        ),
        GetPage(
          name: Routes.emailLogin,
          page: () => const EmailLoginPage(),
          binding: BindingsBuilder.put(() => EmailLoginController()),
        ),
        GetPage(
          name: Routes.signUpInfo,
          page: () => const SignUpInfoInputPage(),
          binding: BindingsBuilder(() {
            Get.put(SignUpInfoInputController());
            Get.lazyPut(() => SocialStep1Controller());
            Get.lazyPut(() => EmailStep1Controller());
            Get.lazyPut(() => Step2Controller());
            Get.lazyPut(() => Step3Controller());
          }),
        ),
        GetPage(
          name: Routes.profileSetting,
          page: () => const ProfileSettingPage(),
          binding: BindingsBuilder.put(() => ProfileSettingController()),
        ),
        GetPage(
          name: Routes.accountSetting,
          page: () => const AccountManagePage(),
          binding: BindingsBuilder.put(() => AccountManageController()),
        ),
        GetPage(
          name: Routes.noticeSetting,
          page: () => const NotificationSettingPage(),
          binding: BindingsBuilder.put(() => NotificationSettingController()),
        ),
      ];
}
