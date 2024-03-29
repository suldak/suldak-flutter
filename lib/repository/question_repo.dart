import 'package:get/get.dart';

import '../model/base_response.dart';
import '../model/sign_up/sign_up_question.dart';
import 'base_api.dart';

class QuestionRepository extends GetxService with API {
  @override
  String get apiName => 'Question API';

  static QuestionRepository get to => Get.find<QuestionRepository>();

  static const _getQuestionListEp = '/api/question/view/question-list';
  static const _userSelectEp = '/api/question/user-select';

  Future<List<SignUpQuestion>?> getQuestionList({
    OnServerException? onServerException,
  }) async {
    final res = await get(_getQuestionListEp);
    final data = res.validateData(onServerException);

    if (data != null) {
      return List.from(
          data['data']?.map((dataJson) => SignUpQuestion.fromJson(dataJson)));
    }
    return null;
  }

  Future<BaseResponse?> setUserSelect({
    required List<Map<String, dynamic>> selection,
    OnServerException? onServerException,
  }) async {
    final res = await post(
      _userSelectEp,
      data: {
        'questionAnswerMap': selection,
      },
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }
}
