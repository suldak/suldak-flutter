import 'sign_up_selection.dart';

class SignUpQuestion {
  int? questionPriKey;
  List<SignUpSelection>? liquorAnswerRes;
  String? qtext;
  int? qindex;

  SignUpQuestion({
    this.questionPriKey,
    this.liquorAnswerRes,
    this.qtext,
    this.qindex,
  });

  SignUpQuestion.fromJson(Map<String, dynamic> json) {
    List<dynamic> selectionList = json['liquorAnswerRes'];
    liquorAnswerRes = selectionList.map((i) => SignUpSelection.fromJson(i)).toList();
    questionPriKey = json['questionPriKey']?.toInt();
    qindex = json['qindex']?.toInt();
    qtext = json['qtext']?.toString();
  }
}