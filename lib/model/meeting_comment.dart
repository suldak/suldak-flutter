import '../config/urls.dart';

/// ## 모임 댓글 모델
class MeetingComment {
  /// ### 대댓글 리스트
  List<MeetingComment?>? childrenComment;
  /// ### 댓글 내용
  String? comment;
  /// ### 댓글 Dep (대댓글)
  int? commentDep;
  /// ### 댓글 생성 시간
  String? createdAt;
  /// ### 댓글 Group (대댓글)
  String? groupComment;
  /// ### 댓글 기본키
  String? id;
  /// ### 댓글 삭제 여부
  bool? isDelete;
  /// ### 댓글 수정 여부
  bool? isModified;
  /// ### 유저가 댓글을 신고한 여부
  bool? isReport;
  /// ### string($date-time)
  String? modifiedAt;
  /// ### 댓글이 작성된 모임 썸네일 URL
  String? partyFileNm;
  /// ### 댓글이 작성된 모임 이름
  String? partyName;
  /// ### 댓글이 작성된 모임 기본키
  int? partyPriKey;
  /// ### 댓글 작성장 프로필 사진 URL
  String? userFileNm;
  /// ### 댓글 작성자 기본키
  String? userNickname;
  /// ### 댓글 작성자
  int? userPriKey;
  /// ### 댓글 신고 개수
  int? warningCnt;

  MeetingComment({
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

  MeetingComment.fromJson(Map<String, dynamic> json) {
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

  /// 사용자 프로필 사진 URL에 [baseUrl]을 추가해 바로 사용 가능한 사진 URL을 반환
  String? getFileUrl() {
    if (userFileNm != null && userFileNm!.isNotEmpty) {
      return AppUrls.baseUrl + userFileNm!;
    }
    return null;
  }
}