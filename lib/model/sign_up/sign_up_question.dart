import 'sign_up_selection.dart';

class SignUpQuestion {
  int? questionPriKey;
  List<SignUpSelection>? liquorAnswerRes;
  String? qtext;
  int? qindex;

  SignUpQuestion._({
    this.questionPriKey,
    this.liquorAnswerRes,
    this.qtext,
    this.qindex,
  });

  factory SignUpQuestion.fromJson(Map<String, dynamic> json) {
    final arr0 = <SignUpSelection>[];
    if (json['liquorAnswerRes'] != null) {
      final v = json['liquorAnswerRes'];
      v.forEach((v) {
        arr0.add(SignUpSelection.fromJson(v));
      });
    }

    return SignUpQuestion._(
        questionPriKey: json['questionPriKey']?.toInt(),
        liquorAnswerRes: arr0,
        qtext: json['qtext']?.toString(),
        qindex: json['qindex']?.toInt(),
    );
  }
}