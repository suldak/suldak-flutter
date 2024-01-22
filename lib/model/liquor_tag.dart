class LiquorTagModel {
  int? id;
  String? name;

  LiquorTagModel._({this.id, this.name});

  factory LiquorTagModel.fromJson(Map json) {
    return LiquorTagModel._(
      id: json['id'].toInt(),
      name: json['name'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
