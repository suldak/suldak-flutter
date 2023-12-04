class SignUpSelection {
  int? priKey;
  int? questionPriKey;
  String? atext;
  int? aindex;

  SignUpSelection({
    this.priKey,
    this.questionPriKey,
    this.atext,
    this.aindex,
  });

  SignUpSelection.fromJson(Map<String, dynamic> json) {
    priKey = json['priKey']?.toInt();
    questionPriKey = json['questionPriKey']?.toInt();
    atext = json['atext']?.toString();
    aindex = json['aindex']?.toInt();
  }
}
