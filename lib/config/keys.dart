/// local storage 사용시에 key 값으로 사용되는 문자열
abstract class Keys {
  /// [String] - app version.
  static const appVersion = 'app_version';

  /// [String] - build 넘버.
  static const buildNo = 'build_no';

  /// [String] - firebase token id
  static const fbTokenId = 'fb_token_id';

  /// [String] - firebase provider
  static const fbProvider = 'fb_provider';

  /// [String] - firebase user email
  static const fbUserEmail = 'fb_user_email';

  /// [String] - firebase user profile image
  static const fbUserProfile = 'fb_user_profile';

  /// [String] - fcm token
  static const fcmToken = 'fb_fcm_token';

  /// [int] - 팝업 24시간 동안 보지 않기를 탭한 순간의 millisecondFromEpoch
  static const popupNotShowDate = 'popup_not_show_date';
}