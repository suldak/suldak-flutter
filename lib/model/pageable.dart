import 'package:flutter/cupertino.dart';

abstract class Pageable<T> {
  /// 총 개수
  final int total;

  /// 목록
  late final List<T> list;

  /// json 데이터로 각 클래스 생성
  T parseData(Map<String, dynamic> data);

  @mustCallSuper
  Pageable(Map data) : total = data['totalElements'] {
    list = (data['content'] as List?)?.map((e) => parseData(e)).toList() ?? [];
  }
}