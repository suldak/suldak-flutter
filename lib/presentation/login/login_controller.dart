import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;

import '../../config/routes.dart';
import '../../global_controller.dart';
import '../../model/user.dart';
import '../../repository/auth_repo.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void kakaoLogin() async {
    if (await kakao.isKakaoTalkInstalled()) {
      try {
        final res = await kakao.UserApi.instance.loginWithKakaoTalk();
        kakaoServerLogin(res);
        log('카카오톡으로 로그인 성공');
      } catch (error) {
        log('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final res = await kakao.UserApi.instance.loginWithKakaoAccount();
          kakaoServerLogin(res);
          log('카카오계정으로 로그인 성공');
        } catch (error) {
          log('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        final res = await kakao.UserApi.instance.loginWithKakaoAccount();
        kakaoServerLogin(res);
        log('카카오계정으로 로그인 성공');
      } catch (error) {
        log('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  void kakaoServerLogin(kakao.OAuthToken userToken) async {
    final userData = await AuthRepository.to
        .loginWithKakao(accessToken: userToken.accessToken);
    if (userData != null) {
      if (userData.identity != null && userData.identity!.isNotEmpty) {
        navigateSignUpInfo(true, userData, userToken.accessToken);
      } else {
        await GlobalController.to.saveUserInfo(userData);
        navigateToHome();
      }
    }
  }

  void naverLogin() async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();
    if (result.status == NaverLoginStatus.loggedIn) {
      NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;

      final userData = await AuthRepository.to
          .loginWithNaver(accessToken: token.accessToken);
      if (userData != null) {
        if (userData.identity != null && userData.identity!.isNotEmpty) {
          navigateSignUpInfo(true, userData, token.accessToken);
        } else {
          await GlobalController.to.saveUserInfo(userData);
          navigateToHome();
        }
      }
    }
  }

  void googleLogin() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    // 굳이 firebase에 로그인 처리해놓을 필요 없음
    // https://velog.io/@tygerhwang/Flutter-Firebase-Authentication-%EC%82%AC%EC%9A%A9%ED%95%B4-%EB%B3%B4%EA%B8%B0-1%ED%8E%B8
    // UserCredential userCredential =
    //     await FirebaseAuth.instance.signInWithCredential(credential);

    if (credential.accessToken != null) {
      final userData = await AuthRepository.to
          .loginWithGoogle(accessToken: credential.accessToken!);
      if (userData != null) {
        if (userData.identity != null && userData.identity!.isNotEmpty) {
          navigateSignUpInfo(true, userData, credential.accessToken!);
        } else {
          await GlobalController.to.saveUserInfo(userData);
          navigateToHome();
        }
      }
    }
  }

  void navigateSignUpInfo(bool isSocial, UserModel userModel, String socialToken) {
    Get.toNamed(
      Routes.signUpInfo,
      arguments: {
        'isSocial': isSocial,
        'userData': userModel,
        'socialToken': socialToken,
      },
    );
  }

  void navigateEmailLogin() {
    Get.toNamed(Routes.emailLogin);
  }

  void navigateToHome() {
    Get.toNamed(Routes.home);
  }

// Life Cycle ▼ ------------------------------------------------------
}
