import 'package:get/get.dart';

import '../model/base_response.dart';
import '../model/user.dart';
import 'base_api.dart';

class AuthRepository extends GetxService with API {
  @override
  String get apiName => 'Auth API';

  static AuthRepository get to => Get.find<AuthRepository>();

  static const _googleLoginEp = '/api/auth/google';
  static const _kakaoLoginEp = '/api/auth/kakao';
  static const _naverLoginEp = '/api/auth/naver';

  static const _signupEp = '/api/auth/signup';
  static const _emailLoginEp = '/api/auth/login';
  static const _logoutEp = '/api/auth/logout';

  Future<UserModel?> loginWithGoogle(
    String accessToken, {
    OnServerException? onServerException,
  }) async {
    final res = await get(
      _googleLoginEp,
      data: {'accessToken': accessToken},
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return UserModel.fromJson(data['data']);
    }
    return null;
  }

  Future<UserModel?> loginWithKakao(
    String accessToken, {
    OnServerException? onServerException,
  }) async {
    final res = await get(
      _kakaoLoginEp,
      data: {'accessToken': accessToken},
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return UserModel.fromJson(data['data']);
    }
    return null;
  }

  Future<UserModel?> loginWithNaver(
    String accessToken, {
    OnServerException? onServerException,
  }) async {
    final res = await get(
      _naverLoginEp,
      data: {'accessToken': accessToken},
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return UserModel.fromJson(data['data']);
    }
    return null;
  }

  Future<UserModel?> loginWithEmail(
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
      return UserModel.fromJson(data['data']);
    }
    return null;
  }

  Future<BaseResponse?> signUp(
    int year,
    String gender,
    String nickname,
    String registration,
    String email,
    String? password, {
    OnServerException? onServerException,
  }) async {

    final userData = {
      'birthdayYear': year,
      'gender': gender,
      'nickname': nickname,
      'registration': registration,
      'userEmail': email,
    };

    if (password != null) {
      userData['userPw'] = password;
    }

    final res = await post(
      _signupEp,
      data: userData,
    );
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }

  Future<BaseResponse?> logout({OnServerException? onServerException}) async {
    final res = await post(_logoutEp);
    final data = res.validateData(onServerException);

    if (data != null) {
      return BaseResponse.fromJson(data);
    }
    return null;
  }
}
