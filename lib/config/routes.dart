/// ## 각 페이지의 Routing name 이 선언되어 있는 class
/// 모든 화면 라우팅은 [Get.toNamed]를 통해서 진행하는 것으로 하며, 이때 사용하는
/// routing name이 해당 클래스의 static 맴버로 정의되어 있다.
abstract class Routes {
  /// 최초 어플리케이션이 시작하는 화면
  static const splash = '/';

  /// 온보딩 화면
  static const onboarding = '/onboarding';

  /// 홈화면
  static const home = '/home';

  /// 로그인 화면
  static const login = '/login';

  /// 프로필 화면
  static const profile = '/profile';

  /// 프로필 설정 화면
  static const profileSetting = '/profile_setting';
}