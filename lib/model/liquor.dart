import 'tag.dart';

class LiquorModel {
  /// ### 술 생성 일자
  String? createdAt;
  /// ### 술의 정확한 도수
  int? detailAbv;
  /// ### 술 상세 설명
  String? detailExplanation;
  /// ### 주량 태그 모델
  TagModel? drinkingCapacity;
  /// ### 술 기본키
  int? id;
  /// ### 도수 태그 모델
  TagModel? liquorAbv;
  /// ### 2차 분류 태그 모델
  TagModel? liquorDetail;
  /// ### 술 재료 태그 모델 리스트
  List<TagModel>? liquorMaterial;
  /// ### 1차 분류 태그 모델
  TagModel? liquorName;
  /// ### 술 레시피
  String? liquorRecipe;
  /// ### 술 판매처 태그 리스트
  List<TagModel>? liquorSell;
  /// ### 술 안주 태그 리스트
  List<TagModel>? liquorSnackRes;
  /// ### 술 수정 일자
  String? modifiedAt;
  /// ### 술 이름
  String? name;
  /// ### 술 상태 태그 모델 (ex: 기분 전환, 피곤할 때)
  List<TagModel>? stateType;
  /// ### 술 요약 설명
  String? summaryExplanation;
  /// ### 맛 종류 태그 모델
  List<TagModel>? tasteType;

  LiquorModel({
    this.createdAt,
    this.detailAbv,
    this.detailExplanation,
    this.drinkingCapacity,
    this.id,
    this.liquorAbv,
    this.liquorDetail,
    this.liquorMaterial,
    this.liquorName,
    this.liquorRecipe,
    this.liquorSell,
    this.liquorSnackRes,
    this.modifiedAt,
    this.name,
    this.stateType,
    this.summaryExplanation,
    this.tasteType,
  });

  LiquorModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt']?.toString();
    detailAbv = json['detailAbv']?.toInt();
    detailExplanation = json['detailExplanation']?.toString();
    drinkingCapacity = (json['drinkingCapacityDto'] != null)
        ? TagModel.fromJson(json['drinkingCapacityDto'])
        : null;
    id = json['id']?.toInt();
    liquorAbv = (json['liquorAbvDto'] != null)
        ? TagModel.fromJson(json['liquorAbvDto'])
        : null;
    liquorDetail = (json['liquorDetailDto'] != null)
        ? TagModel.fromJson(json['liquorDetailDto'])
        : null;
    liquorMaterial = jsonToLiquorTag(json['liquorMaterialDtos']);
    liquorName = (json['liquorNameDto'] != null)
        ? TagModel.fromJson(json['liquorNameDto'])
        : null;
    liquorRecipe = json['liquorRecipe']?.toString();
    liquorSell = jsonToLiquorTag(json['liquorSellDtos']);
    liquorSnackRes = jsonToLiquorTag(json['liquorSnackRes']);
    modifiedAt = json['modifiedAt']?.toString();
    name = json['name']?.toString();
    stateType = jsonToLiquorTag(json['stateTypeDtos']);
    summaryExplanation = json['summaryExplanation']?.toString();
    tasteType = jsonToLiquorTag(json['tasteTypeDtos']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['detailAbv'] = detailAbv;
    data['detailExplanation'] = detailExplanation;
    data['drinkingCapacityDto'] = drinkingCapacity?.toJson();
    data['id'] = id;
    data['liquorAbvDto'] = liquorAbv?.toJson();
    data['liquorDetailDto'] = liquorDetail?.toJson();
    data['liquorMaterialDtos'] = liquorMaterial?.map((e) => e.toJson()).toList();
    data['liquorNameDto'] = liquorName?.toJson();
    data['liquorRecipe'] = liquorRecipe;
    data['liquorSellDtos'] = liquorSell?.map((e) => e.toJson()).toList();
    data['liquorSnackRes'] = liquorSnackRes?.map((e) => e.toJson()).toList();
    data['modifiedAt'] = modifiedAt;
    data['name'] = name;
    data['stateTypeDtos'] = stateType?.map((e) => e.toJson()).toList();
    data['summaryExplanation'] = summaryExplanation;
    data['tasteTypeDtos'] = tasteType?.map((e) => e.toJson()).toList();
    return data;
  }

  /// fromJson 함수에서 tag list json을 모델로 변환하는 함수
  List<TagModel> jsonToLiquorTag(dynamic data) {
    return data
        ?.map<TagModel>((e) => TagModel.fromJson(e))
        .toList();
  }

  /// 모든 태그의 타이틀을 string list로 반환
  List<String> getAllTagsTitle() {
    final List<String> list = [];
    if (liquorDetail?.name != null) {
      list.add(liquorDetail!.name!);
    }
    if (liquorSnackRes != null && liquorSnackRes!.isNotEmpty) {
      list.addAll(liquorSnackRes!.getRange(0, 1).map((e) => e.name!).toList());
    }
    if (liquorMaterial != null && liquorMaterial!.isNotEmpty) {
      list.addAll(liquorMaterial!.getRange(0, 1).map((e) => e.name!).toList());
    }
    if (liquorSell != null && liquorSell!.isNotEmpty) {
      list.addAll(liquorSell!.getRange(0, 1).map((e) => e.name!).toList());
    }

    return list;
  }
}