class TagModel {
  int? id;
  String? name;

  TagModel._({this.id, this.name});

  factory TagModel.fromJson(Map json) {
    return TagModel._(
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
