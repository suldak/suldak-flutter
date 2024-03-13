import 'package:get/get.dart';

class SignUpSelection {
  /// ### 답변 기본 키
  int? priKey;
  /// ### 질문의 기본키
  int? questionPriKey;
  /// ### 텍스트
  String? atext;
  /// ### 인덱스
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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['priKey'] = priKey;
    data['questionPriKey'] = questionPriKey;
    data['aindex'] = aindex;
    data['atext'] = atext;
    return data;
  }
}
