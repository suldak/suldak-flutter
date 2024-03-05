import '../config/urls.dart';
import 'meeting_comment.dart';

class MeetingCommentRoot {
  List<MeetingComment?>? childrenComment;
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

  MeetingCommentRoot({
    this.childrenComment,
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

  MeetingCommentRoot.fromJson(Map<String, dynamic> json) {
    childrenComment = json['childrenComment']
        ?.map<MeetingComment>((i) => MeetingComment.fromJson(i))
        .toList();
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
    data['childrenComment'] = childrenComment?.map((e) => e?.toJson()).toList();
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
    if (userFileNm != null && userFileNm!.isNotEmpty) {
      return AppUrls.baseUrl + userFileNm!;
    }
    return null;
  }
}