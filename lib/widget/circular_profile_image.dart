import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/urls.dart';

class CircularProfileImage extends StatelessWidget {
  const CircularProfileImage({
    super.key,
    required this.size,
    required this.isHighlighted,
    this.imageUrl,
  });

  final bool isHighlighted;
  final String? imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    // 테스트 데이터를 위한 분기
    // 추후 테스트 url이 없을 때 [imageUrl]이 null인지 확인하고
    // 앞에 base url을 추가하는 방식으로 변경
    String? url;
    if (imageUrl != null && !imageUrl!.startsWith('http')) {
      url = AppUrls.baseUrl + imageUrl!;
    } else {
      url = imageUrl;
    }
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: isHighlighted ? AppColors.primary : Colors.white,
          width: 1,
        ),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        clipBehavior: Clip.hardEdge,
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: url!,
                fit: BoxFit.cover,
              )
            : Container(color: AppColors.grey),
      ),
    );
  }
}
