import 'liquor_tag.dart';

class LiquorModel {
  String? createdAt;
  int? detailAbv;
  String? detailExplanation;
  LiquorTagModel? drinkingCapacity;
  int? id;
  LiquorTagModel? liquorAbv;
  LiquorTagModel? liquorDetail;
  List<LiquorTagModel>? liquorMaterial;
  LiquorTagModel? liquorName;
  String? liquorRecipe;
  List<LiquorTagModel>? liquorSell;
  List<LiquorTagModel>? liquorSnackRes;
  String? modifiedAt;
  String? name;
  List<LiquorTagModel>? stateType;
  String? summaryExplanation;
  List<LiquorTagModel>? tasteType;

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
        ? LiquorTagModel.fromJson(json['drinkingCapacityDto'])
        : null;
    id = json['id']?.toInt();
    liquorAbv = (json['liquorAbvDto'] != null)
        ? LiquorTagModel.fromJson(json['liquorAbvDto'])
        : null;
    liquorDetail = (json['liquorDetailDto'] != null)
        ? LiquorTagModel.fromJson(json['liquorDetailDto'])
        : null;
    liquorMaterial = jsonToLiquorTag(json['liquorMaterialDtos']);
    liquorName = (json['liquorNameDto'] != null)
        ? LiquorTagModel.fromJson(json['liquorNameDto'])
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

  List<LiquorTagModel> jsonToLiquorTag(dynamic data) {
    return data
        ?.map<LiquorTagModel>((e) => LiquorTagModel.fromJson(e))
        .toList();
  }

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