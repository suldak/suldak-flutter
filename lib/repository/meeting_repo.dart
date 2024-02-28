import 'package:get/get.dart';

import '../config/const.dart';
import '../model/meeting.dart';
import 'base_api.dart';

class MeetingRepo extends GetxService with API {

  @override
  String get apiName => 'Meeting API';

  static MeetingRepo get to => Get.find<MeetingRepo>();

  static const _searchMeetingEp = '/api/party/view';
  static const _getUserMeetingEp = '/api/party/view/user-party-list';

  Future<List<Meeting>?> searchMeetingList({
    required int page,
    required int size,
    required bool isLatest,
    String? name,
    String? searchStartTime,
    String? searchEndTime,
    String? meetingType, // OFF_LINE, ON_LINE
    OnServerException? onServerException,
  }) async {
    final res = await get(
      _searchMeetingEp,
      data: {
        'pageNum': page,
        'recordSize': size,
        'name': name,
      }
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      final List<Meeting> meetingList =
          data['data'].map<Meeting>((e) => Meeting.fromJson(e)).toList();
      return meetingList;
    }
    return null;
  }

  Future<List<Meeting>?> getUserMeetingList({
    required int userPk,
    required bool isLatest,
    MeetingGuestType? confirm,
    MeetingType? type,
    List<int>? partTagKey,
    String? searchStartTime,
    String? searchEndTime,
    OnServerException? onServerException,
  }) async {
    final res = await get(
        '$_getUserMeetingEp/$userPk',
        data: {
          'sortBool': isLatest,
          'confirm': confirm?.serverCode,
          'partyTagKey': partTagKey?.join(','),
          'partyType': type?.serverCode,
          'searchStartTime': searchStartTime,
          'searchEndTime': searchEndTime,
        }
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      final List<Meeting> meetingList =
          data['data'].map<Meeting>((e) => Meeting.fromJson(e)).toList();
      return meetingList;
    }
    return null;
  }

  Future<List<Meeting>?> getUserHostMeetingList({
    required int userPk,
    required bool isLatest,
    OnServerException? onServerException,
  }) async {
    final res = await get(
        '$_getUserMeetingEp/$userPk',
        data: {
          'isLatest': isLatest,
        }
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      final List<Meeting> meetingList =
          data['data'].map<Meeting>((e) => Meeting.fromJson(e)).toList();
      return meetingList;
    }
    return null;
  }
}