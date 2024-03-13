/// ## 태그 모델 (분류, 카테고리등 통합)
class TagModel {
  /// ### 기본 키
  int? id;
  /// ### 이름
  String? name;
  /// ### 표시 색상
  String? color;

  TagModel._({this.id, this.name, this.color});

  factory TagModel.fromJson(Map json) {
    return TagModel._(
      id: json['id'].toInt(),
      name: json['name'].toString(),
      color: json['color'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}
