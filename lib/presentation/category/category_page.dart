import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suldak_suldak/presentation/category/category_controller.dart';
import 'package:suldak_suldak/widget/base_app_bar.dart';
import 'package:suldak_suldak/widget/tag_widget.dart';
import '../../widget/common_recommend_drinks.dart';

/**
 * 이슈 목록
 * - 카테고리 리스트 아직 구현 안됨
 * - padding 값 등 UI 디자인에서 확인안되는 figma 문제
 * - tagWiget 클릭해도 변경 안되는 문제 남아있음
 */

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = controller.sampleCategoryList;
    String selectedItem = Get.arguments;

    return Scaffold(
      appBar: BaseAppBar(
        title: selectedItem,
        showBackButton: true,
        showBottomLine: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// 카테고리 리스트
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: _buildCategoryList(categoryList, selectedItem),
          ),
          const SizedBox(height: 12),
          /// 카테고리 개수
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: buildCategoryCountText(categoryList.length),
          ),
          /// 추천 음료 리스트
          const RecommendDrinks(paddingSize: 20)
        ],
      ),
    );
  }


  Widget _buildCategoryList(List<String> categoryList, String selectedItem) {
    return Container(
      height: 50,
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final categoryText = categoryList[index];
          return _buildCategoryItem(categoryText, index, selectedItem);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildCategoryItem(String categoryText, int index, String selectedItem) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          TagWidget(
            tag: categoryText,
            isSelected: selectedItem == categoryText,
            onTap: (isSelected) {
              controller.selectedCategory.value = categoryText;
            },
          ),
        ],
      ),
    );
  }


  Widget buildCategoryCountText(int count) {
    return Text("전체 $count종",
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        )
    );
  }
}
