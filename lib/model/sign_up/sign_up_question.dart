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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['questionPriKey'] = questionPriKey;
    if (liquorAnswerRes != null) {
      final v = liquorAnswerRes;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['liquorAnswerRes'] = arr0;
    }
    data['qindex'] = qindex;
    data['qtext'] = qtext;
    return data;
  }
}