import 'package:get/get.dart';

import '../model/base_response.dart';
import '../model/user.dart';
import 'base_api.dart';

/// ## 사용자 로그인/회원가입 관련 api repository
/// 사용자의 로그인 및 회원가입과 같은 authorization 관련 api를 처리하는 repo
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
  static const _refreshTokenEp = '/api/auth/reissue-token';

  Future<UserModel?> loginWithGoogle({
    required String accessToken,
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

  Future<UserModel?> loginWithKakao({
    required String accessToken,
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

  Future<UserModel?> loginWithNaver({
    required String accessToken,
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

  Future<UserModel?> loginWithEmail({
    required String email,
    required String password,
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

  Future<BaseResponse?> signUp({
    required int year,
    required String gender,
    required String nickname,
    required String registration,
    required String email,
    required String? password,
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

  // 현재 미사용
  Future<UserModel?> reissueToken(
      {OnServerException? onServerException}) async {
    final res = await get(_refreshTokenEp);

    final data = res.validateData(onServerException);

    if (data != null) {
      return UserModel.fromJson(data['data']);
    }
    return null;
  }
}
