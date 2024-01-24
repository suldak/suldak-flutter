import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../gen/assets.gen.dart';

class LogoProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoProfileAppBar({super.key});

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
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2, right: 6),
                      child: Assets.svg.notification.svg(width: 20),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: AppColors.alertPrimary,
                        ),
                        width: 6,
                        height: 6,
                      ),
                    ),
                  ],
                ),
              ),
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