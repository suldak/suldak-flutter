import 'package:suldak_suldak/model/pageable.dart';

import 'meeting_comment_root.dart';

class MeetingCommentRootList extends Pageable<MeetingCommentRoot> {
  MeetingCommentRootList(super.data);

  @override
  MeetingCommentRoot parseData(Map<String, dynamic> data) => MeetingCommentRoot.fromJson(data);
}