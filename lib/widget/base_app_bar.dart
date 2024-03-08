import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';
import '../gen/assets.gen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showBottomLine = false,
    this.onTapBackButton,
    this.onTapMoreButton,
  });

  final String title;
  final bool showBackButton;
  final bool showBottomLine;

  final void Function()? onTapBackButton;
  final void Function()? onTapMoreButton;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      bottom: showBottomLine
          ? PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                height: 1,
                color: AppColors.grey[200],
              ),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: Assets.svg.arrowBack.svg(),
              onPressed: () {
                if (onTapBackButton != null) {
                  onTapBackButton!.call();
                } else {
                  Get.back();
                }
              },
            )
          : const SizedBox(),
      actions: [
        if (onTapMoreButton != null)...[
          GestureDetector(
            onTap: onTapMoreButton,
            child: Assets.svg.moreVertical.svg(
              width: 3,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
