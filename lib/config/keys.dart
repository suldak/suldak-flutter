/// local storage 사용시에 key 값으로 사용되는 문자열
abstract class Keys {
  /// [String] - app version.
  static const appVersion = 'app_version';

  /// [String] - build 넘버.
  static const buildNo = 'build_no';

  /// [String] - 사용자 이메일
  static const userEmail= 'user_email';

  /// [String] - 사용자 refresh token
  static const refreshToken = 'refresh_token';

  /// [String] - 사용자 회원가입 방식
  static const registration = 'registration';

  /// [bool] - onboarding 페이지 표시 여부
  static String onboardShown = 'onboard_shown';
}