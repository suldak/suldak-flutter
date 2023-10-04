class User {
  int? birthdayYear;
  String? createdAt;
  String? gender;
  int? id;
  String? identity;
  String? modifiedAt;
  String? nickname;
  String? refreshToken;
  String? registration;
  String? userEmail;

  User._({
    this.birthdayYear,
    this.createdAt,
    this.gender,
    this.id,
    this.identity,
    this.modifiedAt,
    this.nickname,
    this.refreshToken,
    this.registration,
    this.userEmail,
  });

  factory User.fromJson(Map json) {
    return User._(
      birthdayYear: json['birthdayYear']?.toInt(),
      createdAt: json['createdAt']?.toString(),
      gender: json['gender']?.toString(),
      id: json['id']?.toInt(),
      identity: json['identity']?.toString(),
      modifiedAt: json['modifiedAt']?.toString(),
      nickname: json['nickname']?.toString(),
      refreshToken: json['refreshToken']?.toString(),
      registration: json['registration']?.toString(),
      userEmail: json['userEmail']?.toString(),
    );
  }
}
