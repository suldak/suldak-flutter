import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'config/colors.dart';
import 'config/keys.dart';
import 'model/user.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find<GlobalController>();

  /// ## 로그인 여부.
  /// 로그인 여부에 따라서 다른 위젯을 표시하는 경우를 위해 Rx 변수처리.
  /// [Obx] 내부에서 해당 변수 참조시에 전역 위젯의 상태 변경.
  /// ```dart
  /// Obx(() {
  ///   // 전역 로그인 상태 참조
  ///   final isLogin = GlobalController.to.isLogin.value;
  ///   if (isLogin) {
  ///     return ...{login widget};
  ///   }
  ///   return ...{no login widget};
  /// });
  /// ```
  final RxBool isLogin = false.obs;

  /// 로그인 상태 확인 메서드
  Future<void> checkSignIn() async {
    // firebase login + server login 된 상태에서 token 이 저장된다
    String? token = GetStorage().read(Keys.refreshToken);
    if (token != null && token.isNotEmpty) {
      // signed
    } else {
      // firebase 에 로그인된 상태인지 확인
      // User? user = FirebaseAuth.instance.currentUser;
      // if (user != null) {
      //
      //   await user.reload();
      //   String? provider = GetStorage().read(Keys.fbProvider);
      //
      //   if (provider != null && provider.isNotEmpty) {
      //
      //     // 이메일 로그인이면 이메일 인증한 상태인지 확인
      //     if (provider.contains('email') && !user.emailVerified) {
      //       // go verify email
      //     } else {
      //       // signed
      //     }
      //   }
      // } else {
      //   // not signed
      // }
    }
  }

  void showLogoutDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(
                'want_to_logout'.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: AppColors.grey[40] ?? AppColors.grey,
                        ),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'cancel'.tr,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: AppColors.primary,
                        ),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Text(
                          'logout'.tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveUserInfo(UserModel userModel) async {
    String? refreshToken = userModel.refreshToken;
    String? userEmail = userModel.userEmail;
    String? registration = userModel.registration;

    final storage = GetStorage();
    await Future.wait([
      storage.write(Keys.refreshToken, refreshToken),
      storage.write(Keys.userEmail, userEmail),
      storage.write(Keys.registration, registration),
    ]);
    return;
  }

  /// 현재 사용자 logout 함수
  Future<void> signOut() async {
    // User? currentUser = FirebaseAuth.instance.currentUser;
    // if (currentUser != null) {
    //   await Future.forEach(
    //     currentUser.providerData,
    //         (element) async {
    //       switch (element.providerId) {
    //         case 'facebook.com':
    //           await FacebookAuth.instance.logOut();
    //           break;
    //         case 'google.com':
    //           await GoogleSignIn().signOut();
    //           break;
    //       }
    //     },
    //   );
    // }

    // await FirebaseAuth.instance.signOut();

    final storage = GetStorage();
    await Future.wait([
      storage.remove(Keys.refreshToken),
      storage.remove(Keys.userEmail),
      storage.remove(Keys.registration),
    ]);
    isLogin.value = false;
  }
}
