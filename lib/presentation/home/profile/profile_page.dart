import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../widget/base_app_bar.dart';
import '../../../widget/tag_widget.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'my_profile'.tr, showBottomLine: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Divider(thickness: 1, height: 1, color: Colors.grey[20]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  buildBasicProfile(),
                  Divider(thickness: 1, height: 1, color: Colors.grey.shade200),
                  buildProfileCompleteCard(),
                  buildTagDropdownWidget(),
                  const SizedBox(height: 36),
                  buildMyIntro(),
                  const SizedBox(height: 60),
                  buildProfileSettingButton(),
                  const SizedBox(height: 36),
                ],
              ),
            ),
            Divider(thickness: 1, height: 1, color: Colors.grey.shade200),
            buildMenuItem(
              title: 'manage_my_account'.tr,
              onTap: controller.onTapManageMyAccount,
            ),
            buildMenuItem(title: 'self_certification'.tr, onTap: () {}),
            buildMenuItem(
              title: 'notification_setting'.tr,
              onTap: controller.onTapNoticeSetting,
            ),
            buildMenuItem(
              title: 'block_manage'.tr,
              onTap: controller.onTapBlockedUser,
            ),
            buildMenuItem(title: 'inquiry'.tr, onTap: () {}),
            buildMenuItem(
              title: 'logout'.tr,
              onTap: controller.globalController.showLogoutDialog,
            ),
            buildMenuItem(
              title: 'withdraw'.tr,
              onTap: controller.onTapWithdraw,
            ),
            buildMenuItem(
              title: 'app_version'.tr,
              rightWidget: const Text(
                '1.0',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildContactAndTerms(),
                  const SizedBox(height: 16),
                  Text(
                    'Copyright © 술닥술닥 all rights reserved',
                    style: TextStyle(
                      color: AppColors.grey[60],
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildBasicProfile() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.grey[20],
              borderRadius: BorderRadius.circular(60),
            ),
            child: Center(
              child: Assets.svg.user.svg(width: 30),
            ),
          ),
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'name',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'alcohol_level'.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(),
                    const Expanded(child: SizedBox()),
                    Text(
                      '50%',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: 10,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: LinearProgressIndicator(
                    value: 0.5,
                    color: AppColors.primary,
                    backgroundColor: AppColors.grey[30],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileCompleteCard() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 36),
      padding: const EdgeInsets.only(left: 20, right: 10),
      height: 74,
      decoration: BoxDecoration(
        color: AppColors.secondary[30],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 14, right: 22),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: 0.8,
                        color: AppColors.secondary[70],
                        backgroundColor: AppColors.secondary[40],
                      ),
                      Text(
                        '80',
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Assets.svg.camera.svg(width: 32),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${'profile_completion'.tr}80%',
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'self_certification_recommend'.tr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Assets.svg.arrowNext.svg(width: 20),
          ),
        ],
      ),
    );
  }

  Widget buildTagDropdownWidget() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        tilePadding: EdgeInsets.zero,
        shape: Border.all(color: Colors.transparent),
        title: Row(
          children: [
            TagWidget(
              tag: '소주파',
              isSelected: false,
            ),
            TagWidget(
              tag: '술과 함께라면 다 좋아요',
              isSelected: false,
            ),
          ],
        ),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runSpacing: 12,
              alignment: WrapAlignment.start,
              children: [
                TagWidget(
                  tag: '술과 함께라면 다 좋아요',
                  isSelected: false,
                ),
                TagWidget(
                  tag: '술과 함께라면 다 좋아요',
                  isSelected: false,
                ),
                TagWidget(
                  tag: '술과 함께라면 다 좋아요',
                  isSelected: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMyIntro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'introduce_me'.tr,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.grey[30] ?? AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            'introduce_me_hint'.tr,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProfileSettingButton() {
    return GestureDetector(
      onTap: controller.onTapProfileSetting,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.grey[20],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'profile_setting'.tr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String title,
    void Function()? onTap,
    bool showArrow = true,
    Widget? rightWidget,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AppColors.grey[30] ?? AppColors.grey,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Expanded(child: SizedBox()),
            if (rightWidget != null) ...[
              rightWidget,
            ] else if (showArrow) ...[
              Assets.svg.arrowNext.svg(width: 20),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildContactAndTerms() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildTabTextWidget(text: 'Contact', onTap: () {}),
          const VerticalDivider(color: Colors.black),
          buildTabTextWidget(text: 'Feedback', onTap: () {}),
          const VerticalDivider(color: Colors.black),
          buildTabTextWidget(text: 'terms_and_conditions'.tr, onTap: () {}),
        ],
      ),
    );
  }

  Widget buildTabTextWidget({
    required String text,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.grey[70],
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
