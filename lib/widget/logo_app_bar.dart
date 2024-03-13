import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../global_controller.dart';
import 'circular_profile_image.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Assets.png.suldakTextLogo.image(),
      ),
      leadingWidth: 80,
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProfileImage(
              size: 30,
              isHighlighted: false,
              imageUrl: GlobalController.to.userData?.getPictureUrl(),
            ),
          ],
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}