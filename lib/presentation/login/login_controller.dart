import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../config/routes.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  // Variable ▼ ------------------------------------------------------

  // Functions ▼ ------------------------------------------------------

  void kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        requestKakaoUserInfo();
        print('카카오톡으로 로그인 성공');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          requestKakaoUserInfo();
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        requestKakaoUserInfo();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  void requestKakaoUserInfo() async {
    User user;

    try {
      user = await UserApi.instance.me();
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
      return;
    }

    List<String> scopes = [];

    if (user.kakaoAccount?.emailNeedsAgreement == true) {
      scopes.add('account_email');
    }
    if (user.kakaoAccount?.birthdayNeedsAgreement == true) {
      scopes.add("birthday");
    }
    if (user.kakaoAccount?.birthyearNeedsAgreement == true) {
      scopes.add("birthyear");
    }
    if (user.kakaoAccount?.ciNeedsAgreement == true) {
      scopes.add("account_ci");
    }
    if (user.kakaoAccount?.phoneNumberNeedsAgreement == true) {
      scopes.add("phone_number");
    }
    if (user.kakaoAccount?.profileNeedsAgreement == true) {
      scopes.add("profile");
    }
    if (user.kakaoAccount?.ageRangeNeedsAgreement == true) {
      scopes.add("age_range");
    }

    if (scopes.isNotEmpty) {
      print('사용자에게 추가 동의 받아야 하는 항목이 있습니다');

      // OpenID Connect 사용 시
      // scope 목록에 "openid" 문자열을 추가하고 요청해야 함
      // 해당 문자열을 포함하지 않은 경우, ID 토큰이 재발급되지 않음
      // scopes.add("openid")

      //scope 목록을 전달하여 카카오 로그인 요청
      OAuthToken token;
      try {
        token = await UserApi.instance.loginWithNewScopes(scopes);
        print('현재 사용자가 동의한 동의 항목: ${token.scopes}');
      } catch (error) {
        print('추가 동의 요청 실패 $error');
        return;
      }

      // 사용자 정보 재요청
      try {
        User user = await UserApi.instance.me();
        print('사용자 정보 요청 성공'
            '\n회원번호: ${user.id}'
            '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
            '\n이메일: ${user.kakaoAccount?.email}');
      } catch (error) {
        print('사용자 정보 요청 실패 $error');
      }
    }
    navigateSignUpInfo(true);
  }

  void navigateSignUpInfo(bool isSocial) {
    Get.toNamed(Routes.signUpInfo, arguments: {'isSocial': isSocial});
  }

  // Life Cycle ▼ ------------------------------------------------------

}