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
    drinkingCapacity = (json['drinkingCapacityDto'] != null) ? LiquorTagModel.fromJson(json['drinkingCapacityDto']) : null;
    id = json['id']?.toInt();
    liquorAbv = (json['liquorAbvDto'] != null) ? LiquorTagModel.fromJson(json['liquorAbvDto']) : null;
    liquorDetail = (json['liquorDetailDto'] != null) ? LiquorTagModel.fromJson(json['liquorDetailDto']) : null;
    if (json['liquorMaterialDtos'] != null) {
      final v = json['liquorMaterialDtos'];
      final arr0 = <LiquorTagModel>[];
      v.forEach((v) {
        arr0.add(LiquorTagModel.fromJson(v));
      });
      liquorMaterial = arr0;
    }
    liquorName = (json['liquorNameDto'] != null) ? LiquorTagModel.fromJson(json['liquorNameDto']) : null;
    liquorRecipe = json['liquorRecipe']?.toString();
    if (json['liquorSellDtos'] != null) {
      final v = json['liquorSellDtos'];
      final arr0 = <LiquorTagModel>[];
      v.forEach((v) {
        arr0.add(LiquorTagModel.fromJson(v));
      });
      liquorSell = arr0;
    }
    if (json['liquorSnackRes'] != null) {
      final v = json['liquorSnackRes'];
      final arr0 = <LiquorTagModel>[];
      v.forEach((v) {
        arr0.add(LiquorTagModel.fromJson(v));
      });
      liquorSnackRes = arr0;
    }
    modifiedAt = json['modifiedAt']?.toString();
    name = json['name']?.toString();
    if (json['stateTypeDtos'] != null) {
      final v = json['stateTypeDtos'];
      final arr0 = <LiquorTagModel>[];
      v.forEach((v) {
        arr0.add(LiquorTagModel.fromJson(v));
      });
      stateType = arr0;
    }
    summaryExplanation = json['summaryExplanation']?.toString();
    if (json['tasteTypeDtos'] != null) {
      final v = json['tasteTypeDtos'];
      final arr0 = <LiquorTagModel>[];
      v.forEach((v) {
        arr0.add(LiquorTagModel.fromJson(v));
      });
      tasteType = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['detailAbv'] = detailAbv;
    data['detailExplanation'] = detailExplanation;
    if (drinkingCapacity != null) {
      data['drinkingCapacityDto'] = drinkingCapacity!.toJson();
    }
    data['id'] = id;
    if (liquorAbv != null) {
      data['liquorAbvDto'] = liquorAbv!.toJson();
    }
    if (liquorDetail != null) {
      data['liquorDetailDto'] = liquorDetail!.toJson();
    }
    if (liquorMaterial != null) {
      data['liquorMaterialDtos'] = listToJson(liquorMaterial!);
    }
    if (liquorName != null) {
      data['liquorNameDto'] = liquorName!.toJson();
    }
    data['liquorRecipe'] = liquorRecipe;
    if (liquorSell != null) {
      data['liquorSellDtos'] = listToJson(liquorSell!);
    }
    if (liquorSnackRes != null) {
      data['liquorSnackRes'] = listToJson(liquorSnackRes!);
    }
    data['modifiedAt'] = modifiedAt;
    data['name'] = name;
    if (stateType != null) {
      data['stateTypeDtos'] = listToJson(stateType!);
    }
    data['summaryExplanation'] = summaryExplanation;
    if (tasteType != null) {
      data['tasteTypeDtos'] = listToJson(tasteType!);
    }
    return data;
  }

  List<dynamic> listToJson(List<dynamic> list) {
    // return list.map((e) => e.toJson()).toList();
    final result = [];
    for (var item in list) {
      result.add(item.toJson());
    }
    return result;
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