class BlockedUser {
  /// ### 생성 일시
  String? createdAt;
  /// ### 차단 당한 유저의 기본키
  int? cutUserId;
  /// ### 차단 당한 유저의 닉네임
  String? cutUserNickname;
  /// ### 차단 당한 유저의 프로필 사진
  String? cutUserPictureUrl;
  /// ### 기본키
  int? id;
  /// ### 수정 일시
  String? modifiedAt;
  /// ### 해당 유저의 기본키
  int? userId;

  BlockedUser({
    this.createdAt,
    this.cutUserId,
    this.cutUserNickname,
    this.cutUserPictureUrl,
    this.id,
    this.modifiedAt,
    this.userId,
  });

  BlockedUser.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt']?.toString();
    cutUserId = json['cutUserId']?.toInt();
    cutUserNickname = json['cutUserNickname']?.toString();
    cutUserPictureUrl = json['cutUserPictureUrl']?.toString();
    id = json['id']?.toInt();
    modifiedAt = json['modifiedAt']?.toString();
    userId = json['userId']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['cutUserId'] = cutUserId;
    data['cutUserNickname'] = cutUserNickname;
    data['cutUserPictureUrl'] = cutUserPictureUrl;
    data['id'] = id;
    data['modifiedAt'] = modifiedAt;
    data['userId'] = userId;
    return data;
  }
}