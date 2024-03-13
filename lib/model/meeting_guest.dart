import '../config/urls.dart';

/// ## 모임 탐가자 모델
class MeetingGuest {
  /// ### 확정 여부 [CANCEL, COMPLETE, COMPLETE_WAIT, CONFIRM, ON_GOING, REFUSE, WAIT]
  String? confirmState;
  /// ### 유저 사진 URL
  String? guestFileNm;
  /// ### 참석자 레벨
  int? guestLevel;
  /// ### 참석자 닉네임
  String? guestNickname;
  /// ### 참석자 기본키
  int? guestPriKey;
  /// ### 호스트 사진 URL
  String? hostFileNm;
  /// ### 호스트 레벨
  int? hostLevel;
  /// ### 호스트 닉네임
  String? hostNickname;
  /// ### 호스트 기본키
  int? hostPriKey;
  /// ### 참가원 관리 Table 기본키
  String? id;
  /// ### 모임 이름
  String? partyName;
  /// ### 모임 기본키
  int? partyPriKey;

  MeetingGuest({
    this.confirmState,
    this.guestFileNm,
    this.guestLevel,
    this.guestNickname,
    this.guestPriKey,
    this.hostFileNm,
    this.hostLevel,
    this.hostNickname,
    this.hostPriKey,
    this.id,
    this.partyName,
    this.partyPriKey,
  });

  MeetingGuest.fromJson(Map<String, dynamic> json) {
    confirmState = json['confirmState']?.toString();
    guestFileNm = json['guestFileNm']?.toString();
    guestLevel = json['guestLevel']?.toInt();
    guestNickname = json['guestNickname']?.toString();
    guestPriKey = json['guestPriKey']?.toInt();
    hostFileNm = json['hostFileNm']?.toString();
    hostLevel = json['hostLevel']?.toInt();
    hostNickname = json['hostNickname']?.toString();
    hostPriKey = json['hostPriKey']?.toInt();
    id = json['id']?.toString();
    partyName = json['partyName']?.toString();
    partyPriKey = json['partyPriKey']?.toInt();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['confirmState'] = confirmState;
    data['guestFileNm'] = guestFileNm;
    data['guestLevel'] = guestLevel;
    data['guestNickname'] = guestNickname;
    data['guestPriKey'] = guestPriKey;
    data['hostFileNm'] = hostFileNm;
    data['hostLevel'] = hostLevel;
    data['hostNickname'] = hostNickname;
    data['hostPriKey'] = hostPriKey;
    data['id'] = id;
    data['partyName'] = partyName;
    data['partyPriKey'] = partyPriKey;
    return data;
  }

  String? getGuestFileUrl() {
    if (guestFileNm != null) {
      return AppUrls.baseUrl + guestFileNm!;
    }
    return null;
  }
}