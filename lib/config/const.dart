import '../model/meeting.dart';

enum SearchLiquorType {
  tag, liquor
}

enum MeetingType {
  offLine('OFF_LINE'), onLine('ON_LINE');

  const MeetingType(this.serverCode);
  final String serverCode;

  factory MeetingType.getByServerCode(String code) {
    return MeetingType.values.firstWhere(
      (value) => value.serverCode == code,
      orElse: () => MeetingType.offLine,
    );
  }
}

enum MeetingGuestType {
  complete('COMPLETE'),
  completeWait('COMPLETE_WAIT'),
  confirm('CONFIRM'),
  refuse('REFUSE'),
  wait('WAIT'),
  cancel('CANCEL');

  const MeetingGuestType(this.serverCode);
  final String serverCode;

  factory MeetingGuestType.getByServerCode(String code) {
    return MeetingGuestType.values.firstWhere(
          (value) => value.serverCode == code,
      orElse: () => MeetingGuestType.wait,
    );
  }
}

List<Meeting> sampleMeetingList = [
  Meeting(
    confirmCnt: 2,
    contactType: 'sample',
    createdAt: '2020-02-02',
    hostUserName: 'sample',
    hostUserPicture: 'https://shorturl.at/uzAG6',
    hostUserPriKey: 0,
    id: 0,
    introStr: 'this is a sample meeting',
    meetingDay: '2020-12-12',
    modifiedAt: '2020-03-03',
    name: 'sample meeting name',
    onlineUrl: 'www.google.com',
    partyPlace: 'somewhere good',
    partyType: MeetingType.onLine,
    personnel: 3,
    pictureUrl: 'https://shorturl.at/duGW3',
    tagName: 'sample tag',
    tagPriKey: 0,
    useProgram: 'google',
    warningCnt: 3,
  ),
  Meeting(
    confirmCnt: 2,
    contactType: 'sample',
    createdAt: '2020-02-02',
    hostUserName: 'sample',
    hostUserPicture: 'https://shorturl.at/uzAG6',
    hostUserPriKey: 0,
    id: 0,
    introStr: 'this is a sample meeting',
    meetingDay: '2020-12-12',
    modifiedAt: '2020-03-03',
    name: 'sample meeting name',
    onlineUrl: 'www.google.com',
    partyPlace: 'somewhere good',
    partyType: MeetingType.onLine,
    personnel: 3,
    pictureUrl: 'https://shorturl.at/duGW3',
    tagName: 'sample tag',
    tagPriKey: 0,
    useProgram: 'google',
    warningCnt: 3,
  ),
  Meeting(
    confirmCnt: 2,
    contactType: 'sample',
    createdAt: '2020-02-02',
    hostUserName: 'sample',
    hostUserPicture: 'https://shorturl.at/uzAG6',
    hostUserPriKey: 0,
    id: 0,
    introStr: 'this is a sample meeting',
    meetingDay: '2020-12-12',
    modifiedAt: '2020-03-03',
    name: 'sample meeting name',
    onlineUrl: 'www.google.com',
    partyPlace: 'somewhere good',
    partyType: MeetingType.onLine,
    personnel: 3,
    pictureUrl: 'https://shorturl.at/duGW3',
    tagName: 'sample tag',
    tagPriKey: 0,
    useProgram: 'google',
    warningCnt: 3,
  ),
  Meeting(
    confirmCnt: 2,
    contactType: 'sample',
    createdAt: '2020-02-02',
    hostUserName: 'sample',
    hostUserPicture: 'https://shorturl.at/uzAG6',
    hostUserPriKey: 0,
    id: 0,
    introStr: 'this is a sample meeting',
    meetingDay: '2020-12-12',
    modifiedAt: '2020-03-03',
    name: 'sample meeting name',
    onlineUrl: 'www.google.com',
    partyPlace: 'somewhere good',
    partyType: MeetingType.onLine,
    personnel: 3,
    pictureUrl: 'https://shorturl.at/duGW3',
    tagName: 'sample tag',
    tagPriKey: 0,
    useProgram: 'google',
    warningCnt: 3,
  ),
  Meeting(
    confirmCnt: 2,
    contactType: 'sample',
    createdAt: '2020-02-02',
    hostUserName: 'sample',
    hostUserPicture: 'https://shorturl.at/uzAG6',
    hostUserPriKey: 0,
    id: 0,
    introStr: 'this is a sample meeting',
    meetingDay: '2020-12-12',
    modifiedAt: '2020-03-03',
    name: 'sample meeting name',
    onlineUrl: 'www.google.com',
    partyPlace: 'somewhere good',
    partyType: MeetingType.onLine,
    personnel: 3,
    pictureUrl: 'https://shorturl.at/duGW3',
    tagName: 'sample tag',
    tagPriKey: 0,
    useProgram: 'google',
    warningCnt: 3,
  ),
  Meeting(
    confirmCnt: 2,
    contactType: 'sample',
    createdAt: '2020-02-02',
    hostUserName: 'sample',
    hostUserPicture: 'https://shorturl.at/uzAG6',
    hostUserPriKey: 0,
    id: 0,
    introStr: 'this is a sample meeting',
    meetingDay: '2020-12-12',
    modifiedAt: '2020-03-03',
    name: 'sample meeting name',
    onlineUrl: 'www.google.com',
    partyPlace: 'somewhere good',
    partyType: MeetingType.onLine,
    personnel: 3,
    pictureUrl: 'https://shorturl.at/duGW3',
    tagName: 'sample tag',
    tagPriKey: 0,
    useProgram: 'google',
    warningCnt: 3,
  ),
];