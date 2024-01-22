
/// 알림 서비스를 위한 데이터 모델
/// 내용에는 알림의 종류, 이미지, 제목, 날짜가 포함된다.
class NotifyData {
  final String type;
  final String image;
  final String title;
  final DateTime date;

  /// notifyData 생성자
  NotifyData({required this.type, required this.image, required this.title, required this.date});

  /// json 데이터를 notifyData로 변환하는 팩토리 생성자
  factory NotifyData.fromJson(Map<String, dynamic> json) {
    return NotifyData(
      type: json['type'],
      image: json['image'],
      title: json['title'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'image': image,
      'title': title,
      'date': date.toIso8601String(),
    };
  }
}