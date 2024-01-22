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
    liquorAnswerRes = json['liquorAnswerRes']
        ?.map<SignUpSelection>((i) => SignUpSelection.fromJson(i))
        .toList();
    questionPriKey = json['questionPriKey']?.toInt();
    qindex = json['qindex']?.toInt();
    qtext = json['qtext']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['questionPriKey'] = questionPriKey;
    data['liquorAnswerRes'] = liquorAnswerRes?.map((e) => e.toJson()).toList();
    data['qindex'] = qindex;
    data['qtext'] = qtext;
    return data;
  }
}