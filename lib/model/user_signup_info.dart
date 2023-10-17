class UserSignupInfo {
  bool? alarmActive;
  int? birthdayYear;
  String? gender;
  int? id;
  bool? isActive;
  int? level;
  bool? marketingActive;
  String? nickname;
  bool? pushActive;
  String? registration;
  String? selfIntroduction;
  bool? soundActive;
  String? userEmail;
  String? userPw;
  bool? vibrationActive;
  int? warningCnt;

  UserSignupInfo({
    this.alarmActive,
    this.birthdayYear,
    this.gender,
    this.id,
    this.isActive,
    this.level,
    this.marketingActive,
    this.nickname,
    this.pushActive,
    this.registration,
    this.selfIntroduction,
    this.soundActive,
    this.userEmail,
    this.userPw,
    this.vibrationActive,
    this.warningCnt,
  });

  factory UserSignupInfo.fromJson(Map json) {
    return UserSignupInfo(
      alarmActive: json['alarmActive'],
      birthdayYear: json['birthdayYear']?.toInt(),
      gender: json['gender']?.toString(),
      id: json['id']?.toInt(),
      isActive: json['isActive'],
      level: json['level']?.toInt(),
      marketingActive: json['marketingActive'],
      nickname: json['nickname']?.toString(),
      pushActive: json['pushActive'],
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
    data['gender'] = gender;
    data['id'] = id;
    data['isActive'] = isActive;
    data['level'] = level;
    data['marketingActive'] = marketingActive;
    data['nickname'] = nickname;
    data['pushActive'] = pushActive;
    data['registration'] = registration;
    data['selfIntroduction'] = selfIntroduction;
    data['soundActive'] = soundActive;
    data['userEmail'] = userEmail;
    data['userPw'] = userPw;
    data['vibrationActive'] = vibrationActive;
    data['warningCnt'] = warningCnt;
    return data;
  }
}
