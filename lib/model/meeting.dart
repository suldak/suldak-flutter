import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../config/const.dart';
import 'meeting_guest.dart';

/// ## 모임 모델
class Meeting {
  /// ### 완료 했거나 확정된 인원
  int? confirmCnt;
  /// ### 연락수단
  String? contactType;
  /// ### 모임 생성 일시
  String? createdAt;
  /// ### 유저 기준 검색 시, 모임에 대한 유저의 상태 [CANCEL, COMPLETE, COMPLETE_WAIT, CONFIRM, ON_GOING, REFUSE, WAIT]
  MeetingGuestType? guestType;
  /// ### 주최자 이름
  String? hostUserName;
  /// ### 주최자 사진
  String? hostUserPicture;
  /// ### 주최자 기본키
  int? hostUserPriKey;
  /// ### 모임 기본키
  int? id;
  /// ### 모임 소개글
  String? introStr;
  /// ### 모임 일시
  String? meetingDay;
  /// ### 모임 수정 일시
  String? modifiedAt;
  /// ### 모임 이름
  String? name;
  /// ### URL (온라인)
  String? onlineUrl;
  /// ### 모임 장소 (오프라인)
  String? partyPlace;
  /// ### 모임 상태 [MEETING_CANCEL, MEETING_COMPLETE, MEETING_DELETE, ON_GOING, RECRUITING, RECRUITMENT_END]
  /// ### 모임 타입
  MeetingType? partyType;
  /// ### 모임 인원
  int? personnel;
  /// ### 모임 사진 URL
  String? pictureUrl;
  /// ### 모임 태그 이름
  String? tagName;
  /// ### 모임 태그 기본키
  int? tagPriKey;
  /// ### 사용 프로그램 (온라인)
  String? useProgram;
  /// ### 모임 신고 횟수
  int? warningCnt;
  /// ### 모임 참여자 (게스트) 리스트
  List<MeetingGuest>? partyGuestList;

  Meeting({
    this.confirmCnt,
    this.contactType,
    this.createdAt,
    this.guestType,
    this.hostUserName,
    this.hostUserPicture,
    this.hostUserPriKey,
    this.id,
    this.introStr,
    this.meetingDay,
    this.modifiedAt,
    this.name,
    this.onlineUrl,
    this.partyPlace,
    this.partyType,
    this.personnel,
    this.pictureUrl,
    this.tagName,
    this.tagPriKey,
    this.useProgram,
    this.warningCnt,
    this.partyGuestList,
  });

  Meeting.fromJson(Map<String, dynamic> json) {
    confirmCnt = json['confirmCnt']?.toInt();
    contactType = json['contactType']?.toString();
    createdAt = json['createdAt']?.toString();
    guestType =
        MeetingGuestType.getByServerCode(json['guestType']?.toString() ?? '');
    hostUserName = json['hostUserName']?.toString();
    hostUserPicture = json['hostUserPicture']?.toString();
    hostUserPriKey = json['hostUserPriKey']?.toInt();
    id = json['id']?.toInt();
    introStr = json['introStr']?.toString();
    meetingDay = json['meetingDay']?.toString();
    modifiedAt = json['modifiedAt']?.toString();
    name = json['name']?.toString();
    onlineUrl = json['onlineUrl']?.toString();
    partyPlace = json['partyPlace']?.toString();
    partyType =
        MeetingType.getByServerCode(json['partyType']?.toString() ?? '');
    personnel = json['personnel']?.toInt();
    pictureUrl = json['pictureUrl']?.toString();
    tagName = json['tagName']?.toString();
    tagPriKey = json['tagPriKey']?.toInt();
    useProgram = json['useProgram']?.toString();
    warningCnt = json['warningCnt']?.toInt();
    partyGuestList = json['partyGuestList']?.map<MeetingGuest>((e) => MeetingGuest.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['confirmCnt'] = confirmCnt;
    data['contactType'] = contactType;
    data['createdAt'] = createdAt;
    data['guestType'] = guestType;
    data['hostUserName'] = hostUserName;
    data['hostUserPicture'] = hostUserPicture;
    data['hostUserPriKey'] = hostUserPriKey;
    data['id'] = id;
    data['introStr'] = introStr;
    data['meetingDay'] = meetingDay;
    data['modifiedAt'] = modifiedAt;
    data['name'] = name;
    data['onlineUrl'] = onlineUrl;
    data['partyPlace'] = partyPlace;
    data['partyType'] = partyType;
    data['personnel'] = personnel;
    data['pictureUrl'] = pictureUrl;
    data['tagName'] = tagName;
    data['tagPriKey'] = tagPriKey;
    data['useProgram'] = useProgram;
    data['warningCnt'] = warningCnt;
    data['partyGuestList'] = partyGuestList?.map((e) => e.toJson()).toList();
    return data;
  }

  /// ### 모임 카드에 표시되는 포멧의 일자를 반환
  String getFormattedMeetingTime() {
    final DateFormat format = DateFormat(
      'MM.dd(E) a hh:mm',
      Get.deviceLocale?.languageCode,
    );
    final DateTime dateTime = DateTime.parse(meetingDay ?? '');
    return format.format(dateTime);
  }
}