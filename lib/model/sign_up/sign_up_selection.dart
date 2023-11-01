class SignUpSelection {
  int? priKey;
  int? questionPriKey;
  String? atext;
  int? aindex;

  SignUpSelection._({
    this.priKey,
    this.questionPriKey,
    this.atext,
    this.aindex,
  });

  factory SignUpSelection.fromJson(Map<String, dynamic> json) {
    return SignUpSelection._(
      priKey: json['priKey']?.toInt(),
      questionPriKey: json['questionPriKey']?.toInt(),
      atext: json['atext']?.toString(),
      aindex: json['aindex']?.toInt(),
    );
  }
}
