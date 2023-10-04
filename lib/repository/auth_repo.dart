import 'package:get/get.dart';

import '../model/user.dart';
import 'base_api.dart';

class AuthRepository extends GetxService with API {
  @override
  String get apiName => 'Auth API';

  static AuthRepository get to => Get.find<AuthRepository>();

  static const _googleLoginEp = '/auth/google';
  static const _kakaoLoginEp = '/auth/kakao';
  static const _naverLoginEp = '/auth/naver';

  static const _signupEp = '/auth/signup';
  static const _emailLoginEp = '/auth/login';
  static const _logoutEp = '/auth/logout';

  Future<User?> loginWithGoogle(
    String accessToken, {
    OnServerException? onServerException,
  }) async {
    final res = await post(
      _googleLoginEp,
      queries: {'accessToken': accessToken},
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return User.fromJson(data);
    }
    return null;
  }

  Future<User?> loginWithKakao(
    String accessToken, {
    OnServerException? onServerException,
  }) async {
    final res = await post(
      _kakaoLoginEp,
      queries: {'accessToken': accessToken},
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return User.fromJson(data);
    }
    return null;
  }

  Future<User?> loginWithNaver(
    String accessToken, {
    OnServerException? onServerException,
  }) async {
    final res = await post(
      _naverLoginEp,
      queries: {'accessToken': accessToken},
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return User.fromJson(data);
    }
    return null;
  }

  Future<User?> loginWithEmail(
    String email,
    String password, {
    OnServerException? onServerException,
  }) async {
    final res = await post(
      _emailLoginEp,
      data: {
        'userEmail': email,
        'userPw': password,
      },
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return User.fromJson(data);
    }
    return null;
  }

  Future<void> signUp(
    String year,
    String gender,
    int id,
    String nickname,
    String registration,
    String email,
    String password, {
    OnServerException? onServerException,
  }) async {
    final res = await post(
      _signupEp,
      data: {
        'birthdayYear': year,
        'gender': gender,
        'id': id,
        'nickname': nickname,
        'registration': registration,
        'userEmail': email,
        'userPw': password,
      },
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return;
    }
    return;
  }

  Future<void> logout({OnServerException? onServerException}) async {
    final res = await post(_logoutEp);
    final data = res.validateData((msg, code) { });

    if (data != null) {
      return;
    }
    return;
  }
}
