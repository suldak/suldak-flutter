import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/colors.dart';
import '../presentation/meeting_detail/meeting_detail_controller.dart';

class MeetingCommentBottomSheet extends StatelessWidget {
  MeetingCommentBottomSheet(
      {super.key, required this.commentId, required this.isMy,});

  final String commentId;
  final bool isMy;

  final MeetingDetailController controller = MeetingDetailController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 14),
          if (isMy)...[
            buildTextButton(
              onTap: () {
                // 수정 UI 및 플로우 파악 필요
              },
              text: 'modify_comment'.tr,
            ),
            Divider(height: 1, thickness: 1, color: AppColors.grey[300]),
            buildTextButton(
              onTap: () {
                controller.deleteComment(int.parse(commentId));
              },
              text: 'delete_comment'.tr,
            ),
          ] else...[
            buildTextButton(
              onTap: () {
                controller.reportMeetingComment(int.parse(commentId));
              },
              text: 'report_comment'.tr,
              textColor: AppColors.alertError,
            ),
          ],
          Divider(height: 1, thickness: 1, color: AppColors.grey[300]),
          buildTextButton(
            onTap: () => Get.back(),
            text: 'cancel'.tr,
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget buildTextButton({
    required void Function() onTap,
    required String text,
    Color? textColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}