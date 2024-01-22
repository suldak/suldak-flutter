import 'package:suldak_suldak/model/pageable.dart';

import 'liquor.dart';

class LiquorList extends Pageable<LiquorModel> {
  LiquorList(super.data);

  @override
  LiquorModel parseData(Map<String, dynamic> data) => LiquorModel.fromJson(data);
}