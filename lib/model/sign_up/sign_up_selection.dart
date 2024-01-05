import 'package:get/get.dart';

class SignUpSelection {
  int? priKey;
  int? questionPriKey;
  String? atext;
  int? aindex;

  // 사용자 선택을 위한 변수
  Rx<bool> isSelected = false.obs;

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
