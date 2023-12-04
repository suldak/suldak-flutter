import 'package:get/get.dart';

import '../model/sign_up/sign_up_question.dart';
import 'base_api.dart';

class QuestionRepository extends GetxService with API {
  @override
  String get apiName => 'Question API';

  static QuestionRepository get to => Get.find<QuestionRepository>();

  static const _getQuestionListEp = '/api/question/view/question-list';

  Future<List<SignUpQuestion>?> getQuestionList({
    OnServerException? onServerException,
  }) async {
    try {
      final res = await get(_getQuestionListEp);
      final data = res.validateData(onServerException);

      if (data != null) {
        List<dynamic> questionList = data['data'];
        return questionList
            .map((dataJson) => SignUpQuestion.fromJson(dataJson))
            .toList();
      }
      return null;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}
