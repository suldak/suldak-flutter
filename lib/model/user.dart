import '../config/urls.dart';

/// ## 사용자 모델 객체
class UserModel {
  /// ### 알림 여부
  bool? alarmActive;
  /// ### 출생 연도
  int? birthdayYear;
  /// ### 생성 일시
  String? createdAt;
  /// ### 성별 M, W
  String? gender;
  /// ### 유저 기본키
  int? id;
  /// ### 소셜 로그인 비밀번호 생성을 위한 identity 값
  String? identity;
  /// ### 활성화 여부
  bool? isActive;
  /// ### 유저 레벨
  int? level;
  /// ### 마케팅 정보 알림 여부
  bool? marketingActive;
  /// ### 수정 일시
  String? modifiedAt;
  /// ### 닉네임
  String? nickname;
  /// ### 유저 사진 URL
  String? pictureUrl;
  /// ### 앱 푸시 알림 여부
  bool? pushActive;
  /// ### Refresh Token
  String? refreshToken;
  /// ### 가입 방법 [APPLE, GOOGLE, KAKAO, NAVER, SULDAKSULDAK]
  String? registration;
  /// ### 자기소개
  String? selfIntroduction;
  /// ### 소리 알림 여부
  bool? soundActive;
  /// ### Email
  String? userEmail;
  /// ### 비밀번호, server에서 보내주지 않으며 회원가입시 사용
  String? userPw;
  /// ### 진동 알림 여부
  bool? vibrationActive;
  /// ### 신고 누적
  int? warningCnt;

  UserModel({
    this.alarmActive,
    this.birthdayYear,
    this.createdAt,
    this.gender,
    this.id,
    this.identity,
    this.isActive,
    this.level,
    this.marketingActive,
    this.modifiedAt,
    this.nickname,
    this.pictureUrl,
    this.pushActive,
    this.refreshToken,
    this.registration,
    this.selfIntroduction,
    this.soundActive,
    this.userEmail,
    this.userPw,
    this.vibrationActive,
    this.warningCnt,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
      alarmActive: json['alarmActive'],
      birthdayYear: json['birthdayYear']?.toInt(),
      createdAt: json['createdAt']?.toString(),
      gender: json['gender']?.toString(),
      id: json['id']?.toInt(),
      identity: json['identity']?.toString(),
      isActive: json['isActive'],
      level: json['level']?.toInt(),
      marketingActive: json['marketingActive'],
      modifiedAt: json['modifiedAt']?.toString(),
      nickname: json['nickname']?.toString(),
      pictureUrl: json['pictureUrl']?.toString(),
      pushActive: json['pushActive'],
      refreshToken: json['refreshToken']?.toString(),
      registration: json['registration']?.toString(),
      selfIntroduction: json['selfIntroduction']?.toString(),
      soundActive: json['soundActive'],
      userEmail: json['userEmail']?.toString(),
      userPw: json['userPw']?.toString(),
      vibrationActive: json['vibrationActive'],
      warningCnt: json['warningCnt']?.toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['alarmActive'] = alarmActive;
    data['birthdayYear'] = birthdayYear;
    data['createdAt'] = createdAt;
    data['gender'] = gender;
    data['id'] = id;
    data['identity'] = identity;
    data['isActive'] = isActive;
    data['level'] = level;
    data['marketingActive'] = marketingActive;
    data['modifiedAt'] = modifiedAt;
    data['nickname'] = nickname;
    data['pictureUrl'] = pictureUrl;
    data['pushActive'] = pushActive;
    data['refreshToken'] = refreshToken;
    data['registration'] = registration;
    data['selfIntroduction'] = selfIntroduction;
    data['soundActive'] = soundActive;
    data['userEmail'] = userEmail;
    data['userPw'] = userPw;
    data['vibrationActive'] = vibrationActive;
    data['warningCnt'] = warningCnt;
    return data;
  }

  String? getPictureUrl() {
    if (pictureUrl != null) {
      return AppUrls.baseUrl + pictureUrl!;
    }
    return null;
  }
}
