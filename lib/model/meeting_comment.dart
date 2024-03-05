import '../config/urls.dart';

class MeetingComment {
  String? comment;
  int? commentDep;
  String? createdAt;
  String? groupComment;
  String? id;
  bool? isDelete;
  bool? isModified;
  bool? isReport;
  String? modifiedAt;
  String? partyFileNm;
  String? partyName;
  int? partyPriKey;
  String? userFileNm;
  String? userNickname;
  int? userPriKey;
  int? warningCnt;

  MeetingComment({
    this.comment,
    this.commentDep,
    this.createdAt,
    this.groupComment,
    this.id,
    this.isDelete,
    this.isModified,
    this.isReport,
    this.modifiedAt,
    this.partyFileNm,
    this.partyName,
    this.partyPriKey,
    this.userFileNm,
    this.userNickname,
    this.userPriKey,
    this.warningCnt,
  });

  MeetingComment.fromJson(Map<String, dynamic> json) {
    comment = json['comment']?.toString();
    commentDep = json['commentDep']?.toInt();
    createdAt = json['createdAt']?.toString();
    groupComment = json['groupComment']?.toString();
    id = json['id']?.toString();
    isDelete = json['isDelete'];
    isModified = json['isModified'];
    isReport = json['isReport'];
    modifiedAt = json['modifiedAt']?.toString();
    partyFileNm = json['partyFileNm']?.toString();
    partyName = json['partyName']?.toString();
    partyPriKey = json['partyPriKey']?.toInt();
    userFileNm = json['userFileNm']?.toString();
    userNickname = json['userNickname']?.toString();
    userPriKey = json['userPriKey']?.toInt();
    warningCnt = json['warningCnt']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['comment'] = comment;
    data['commentDep'] = commentDep;
    data['createdAt'] = createdAt;
    data['groupComment'] = groupComment;
    data['id'] = id;
    data['isDelete'] = isDelete;
    data['isModified'] = isModified;
    data['isReport'] = isReport;
    data['modifiedAt'] = modifiedAt;
    data['partyFileNm'] = partyFileNm;
    data['partyName'] = partyName;
    data['partyPriKey'] = partyPriKey;
    data['userFileNm'] = userFileNm;
    data['userNickname'] = userNickname;
    data['userPriKey'] = userPriKey;
    data['warningCnt'] = warningCnt;
    return data;
  }

  String? getFileUrl() {
    if (userFileNm != null) {
      return AppUrls.baseUrl + userFileNm!;
    }
    return null;
  }
}
