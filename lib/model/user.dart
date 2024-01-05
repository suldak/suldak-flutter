class UserModel {
  bool? alarmActive;
  int? birthdayYear;
  String? createdAt;
  String? gender;
  int? id;
  String? identity;
  bool? isActive;
  int? level;
  bool? marketingActive;
  String? modifiedAt;
  String? nickname;
  String? pictureUrl;
  bool? pushActive;
  String? refreshToken;
  String? registration;
  String? selfIntroduction;
  bool? soundActive;
  String? userEmail;
  bool? vibrationActive;
  int? warningCnt;

  UserModel._({
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
    this.vibrationActive,
    this.warningCnt,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel._(
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
    data['vibrationActive'] = vibrationActive;
    data['warningCnt'] = warningCnt;
    return data;
  }
}
