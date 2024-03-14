import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/presentation/home/notify/notify_controller.dart';
import 'package:suldak_suldak/presentation/home/notify/notify_page.dart';

import '../presentation/account_manage/account_manage_controller.dart';
import '../presentation/account_manage/account_manage_page.dart';
import '../presentation/announcement/announcement_controller.dart';
import '../presentation/announcement/announcement_page.dart';
import '../presentation/blocked_user/blocked_user_controller.dart';
import '../presentation/blocked_user/blocked_user_page.dart';
import '../presentation/email_login/email_login_controller.dart';
import '../presentation/email_login/email_login_page.dart';
import '../presentation/filter/filter_controller.dart';
import '../presentation/filter/filter_page.dart';
import '../presentation/home/find_friend/find_friend_controller.dart';
import '../presentation/home/home/home_controller.dart';
import '../presentation/home/home_main_controller.dart';
import '../presentation/home/home_main_page.dart';
import '../presentation/home/profile/profile_controller.dart';
import '../presentation/iamport_pass_verify/iamport_pass_verify_page.dart';
import '../presentation/identity_verification/identity_verification_controller.dart';
import '../presentation/identity_verification/identity_verification_page.dart';
import '../presentation/login/login_controller.dart';
import '../presentation/login/login_page.dart';
import '../presentation/make_meeting/make_meeting_main_controller.dart';
import '../presentation/make_meeting/make_meeting_main_page.dart';
import '../presentation/make_meeting/make_meeting_step_1/make_meeting_step_1_controller.dart';
import '../presentation/meeting_apply/meeting_apply_controller.dart';
import '../presentation/meeting_apply_info/meeting_apply_info_controller.dart';
import '../presentation/meeting_apply_info/meeting_apply_info_page.dart';
import '../presentation/meeting_apply/meeting_apply_page.dart';
import '../presentation/meeting_detail/meeting_detail_controller.dart';
import '../presentation/meeting_detail/meeting_detail_page.dart';
import '../presentation/meeting_list/meeting_list_controller.dart';
import '../presentation/meeting_list/meeting_list_page.dart';
import '../presentation/my_meeting/all_meeting/all_meeting_controller.dart';
import '../presentation/my_meeting/my_meeting/my_meeting_controller.dart';
import '../presentation/my_meeting/my_meeting_main_controller.dart';
import '../presentation/my_meeting/my_meeting_main_page.dart';
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
import '../presentation/sign_up_info_input/welcome_page.dart';
import '../presentation/splash/splash_controller.dart';
import '../presentation/splash/splash_page.dart';
import '../presentation/withdraw/agree/withdraw_agree_controller.dart';
import '../presentation/withdraw/agree/withdraw_agree_page.dart';
import '../presentation/withdraw/survey/withdraw_survey_controller.dart';
import '../presentation/withdraw/survey/withdraw_survey_page.dart';
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
          page: () => const HomeMainPage(),
          binding: BindingsBuilder(() {
            Get.put(HomeMainController());
            Get.lazyPut(() => ProfileController());
            Get.lazyPut(() => HomeController());
            Get.lazyPut(() => FindFriendController());
          }),
        ),
        GetPage(
            name: Routes.notify,
            page: () => const NotifyPage(),
            transition: Transition.leftToRight,
            binding: BindingsBuilder.put(() => NotifyController())),
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
        GetPage(
          name: Routes.blockedUser,
          page: () => const BlockedUserPage(),
          binding: BindingsBuilder.put(() => BlockedUserController()),
        ),
        GetPage(
          name: Routes.withdrawAgree,
          page: () => const WithdrawAgreePage(),
          binding: BindingsBuilder.put(() => WithdrawAgreeController()),
        ),
        GetPage(
          name: Routes.withdrawSurvey,
          page: () => const WithdrawSurveyPage(),
          binding: BindingsBuilder.put(() => WithdrawSurveyController()),
        ),
        GetPage(
          name: Routes.identityVerification,
          page: () => const IdentityVerificationPage(),
          binding: BindingsBuilder.put(() => IdentityVerificationController()),
        ),
        GetPage(
          name: Routes.iamportPassVerify,
          page: () => const IamportPassVerifyPage(),
          binding: BindingsBuilder.put(() => IdentityVerificationController()),
        ),
        GetPage(
          name: Routes.welcome,
          page: () => const WelcomePage(),
        ),
        GetPage(
          name: Routes.banner,
          page: () => const AnnouncementPage(),
          binding: BindingsBuilder.put(() => AnnouncementController()),
        ),
        GetPage(
          name: Routes.makeMeeting,
          page: () => const MakeMeetingMainPage(),
          binding: BindingsBuilder(() {
            Get.put(MakeMeetingMainController());
            Get.lazyPut(() => MakeMeetingStep1Controller());
            // Get.lazyPut(() => EmailStep1Controller());
            // Get.lazyPut(() => Step2Controller());
            // Get.lazyPut(() => Step3Controller());
          }),
        ),
        GetPage(
          name: Routes.myMeeting,
          page: () => const MyMeetingMainPage(),
          binding: BindingsBuilder(() {
            Get.put(MyMeetingMainController());
            Get.lazyPut(() => AllMeetingController());
            Get.lazyPut(() => MyMeetingController());
            // Get.lazyPut(() => EmailStep1Controller());
            // Get.lazyPut(() => Step2Controller());
            // Get.lazyPut(() => Step3Controller());
          }),
        ),
        GetPage(
          name: Routes.meetingList,
          page: () => const MeetingListPage(),
          binding: BindingsBuilder.put(() => MeetingListController()),
        ),
        GetPage(
          name: Routes.filter,
          page: () => const FilterPage(),
          binding: BindingsBuilder.put(() => FilterController()),
        ),
        GetPage(
          name: Routes.meetingDetail,
          page: () => const MeetingDetailPage(),
          binding: BindingsBuilder.put(() => MeetingDetailController()),
        ),
        GetPage(
          name: Routes.meetingApply,
          page: () => const MeetingApplyPage(),
          binding: BindingsBuilder.put(() => MeetingApplyController()),
        ),
        GetPage(
          name: Routes.meetingApplyInfo,
          page: () => const MeetingApplyInfoPage(),
          binding: BindingsBuilder.put(() => MeetingApplyInfoController()),
        ),
      ];
}
