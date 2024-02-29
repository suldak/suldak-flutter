import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../config/const.dart';

class Meeting {
  int? confirmCnt;
  String? contactType;
  String? createdAt;
  MeetingGuestType? guestType;
  String? hostUserName;
  String? hostUserPicture;
  int? hostUserPriKey;
  int? id;
  String? introStr;
  String? meetingDay;
  String? modifiedAt;
  String? name;
  String? onlineUrl;
  String? partyPlace;
  MeetingType? partyType;
  int? personnel;
  String? pictureUrl;
  String? tagName;
  int? tagPriKey;
  String? useProgram;
  int? warningCnt;

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
    return data;
  }

  String getFormattedMeetingTime() {
    final DateFormat format = DateFormat(
      'MM.dd(E) a hh:mm',
      Get.deviceLocale?.languageCode,
    );
    final DateTime dateTime = DateTime.parse(meetingDay ?? '');
    return format.format(dateTime);
  }
}