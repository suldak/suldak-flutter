class BlockedUser {
  String? createdAt;
  int? cutUserId;
  String? cutUserNickname;
  String? cutUserPictureUrl;
  int? id;
  String? modifiedAt;
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