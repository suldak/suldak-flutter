import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';
import '../gen/assets.gen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key, required this.title, this.showBackButton = false});

  final String title;
  final bool showBackButton;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColors.grey[20],
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: showBackButton ? IconButton(
        icon: Assets.svg.arrowBack.svg(),
        onPressed: () {
          Get.back();
        },
      ) : const SizedBox(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}