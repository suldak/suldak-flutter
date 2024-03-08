import 'package:get/get.dart';
import 'package:suldak_suldak/model/meeting_comment_root_list.dart';

import '../config/const.dart';
import '../model/base_response.dart';
import '../model/meeting.dart';
import 'base_api.dart';

class MeetingRepo extends GetxService with API {

  @override
  String get apiName => 'Meeting API';

  static MeetingRepo get to => Get.find<MeetingRepo>();

  static const _searchMeetingEp = '/api/party/view';
  static const _getUserMeetingEp = '/api/party/view/user-party-list';
  static const _meetingCommentEp = '/api/party/comment';
  static const _popularMeetingEp = '/api/party/view/popular-list';
  static const _recommendMeetingEp = '/api/party/view/recommend-list';

  static const _reportMeetingEp = '/api/report/submit/party';
  static const _reportMeetingCommentEp = '/api/report/submit/party-comment';

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
        'searchStartTime': searchStartTime,
        'searchEndTime': searchEndTime,
        'partyType': meetingType,
      }
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      final List<Meeting> meetingList =
          data['data']['content'].map<Meeting>((e) => Meeting.fromJson(e)).toList();
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
          'partyTagPriKey': partTagKey?.join(','),
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

  // isGuest: Guest(참여신청자수):Click(조회수) 정렬 여부
  Future<List<Meeting>?> getPopularMeetingList({
    required bool isGuest,
    OnServerException? onServerException,
  }) async {
    final res = await get(
        _popularMeetingEp,
        data: {
          'searchOption': isGuest ? 'GUEST' : 'CLICK',
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

  // isLevel: Level(호스트 알콜 레벨):User(유저의 최근 모임 카테고리) 정렬 여부
  Future<List<Meeting>?> getRecommendMeetingList({
    required bool isLevel,
    int? limitNum,
    OnServerException? onServerException,
  }) async {
    final res = await get(
        _recommendMeetingEp,
        data: {
          'limitNum': limitNum,
          'searchOption': isLevel ? 'LEVEL' : 'USER',
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

  Future<Meeting?> getMeetingInfo({
    required int meetingPk,
    OnServerException? onServerException,
  }) async {
    final res = await get(
      '$_searchMeetingEp/$meetingPk',
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      final Meeting meeting = Meeting.fromJson(data['data']);
      return meeting;
    }
    return null;
  }

  Future<MeetingCommentRootList?> getMeetingComment({
    required int meetingPk,
    int? page,
    int? size,
    OnServerException? onServerException,
  }) async {
    final res = await get(
        '$_meetingCommentEp/$meetingPk',
        data: {
          'pageNum': page,
          'recordSize': size,
        }
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      final MeetingCommentRootList meetingCommentRootList =
          MeetingCommentRootList(data['data']);
      return meetingCommentRootList;
    }
    return null;
  }

  Future<BaseResponse?> postMeetingComment({
    required int meetingPk,
    required String comment,
    OnServerException? onServerException,
  }) async {
    final res = await post(
        '$_meetingCommentEp/$meetingPk',
        data: {
          'comment': comment,
        }
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }

  Future<BaseResponse?> deleteMeetingComment({
    required int commentPk,
    OnServerException? onServerException,
  }) async {
    final res = await delete(
        '$_meetingCommentEp/$commentPk',
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }

  Future<BaseResponse?> reportMeeting({
    required int meetingPk,
    OnServerException? onServerException,
  }) async {
    final res = await post(
      '$_reportMeetingEp/$meetingPk',
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }

  Future<BaseResponse?> reportMeetingComment({
    required int commentPk,
    OnServerException? onServerException,
  }) async {
    final res = await post(
      '$_reportMeetingCommentEp/$commentPk',
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }
}