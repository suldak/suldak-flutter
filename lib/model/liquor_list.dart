import 'package:suldak_suldak/model/pageable.dart';

import 'liquor.dart';

/// ## 술 pageable 모델
class LiquorList extends Pageable<LiquorModel> {
  LiquorList(super.data);

  @override
  LiquorModel parseData(Map<String, dynamic> data) => LiquorModel.fromJson(data);
}