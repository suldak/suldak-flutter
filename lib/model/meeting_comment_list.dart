import 'package:suldak_suldak/model/pageable.dart';

import 'meeting_comment.dart';

/// ## 모임 댓글 pageable 모델
class MeetingCommentRootList extends Pageable<MeetingComment> {
  MeetingCommentRootList(super.data);

  @override
  MeetingComment parseData(Map<String, dynamic> data) => MeetingComment.fromJson(data);
}