import '../config/urls.dart';

class MeetingGuest {

  String? confirmState;
  String? guestFileNm;
  int? guestLevel;
  String? guestNickname;
  int? guestPriKey;
  String? hostFileNm;
  int? hostLevel;
  String? hostNickname;
  int? hostPriKey;
  String? id;
  String? partyName;
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