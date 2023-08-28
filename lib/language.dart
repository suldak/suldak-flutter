import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ko_KR': kr,
    'en_US': en,
  };

  Map<String, String> kr = {
    'yes': '네',
    'no': '아니요',
    'ok': '확인',
    'cancel': '취소',
    'close': '닫기',
    'welcome': '환영합니다.',
    'next': '다음',
    'email': '이메일',
    'password': '비밀번호',
    'password_check': '비밀번호 확인',
    'password_find': '비밀번호를 잊으셨나요?',
    'password_wrong': '비밀번호가 유효하지 않거나 사용자에게 비밀번호가 없습니다.',
    'later': '나중에하기',
    'login_title': '로그인 후\n페인터어스를\n만나보세요.',
    'sign_up_title': '페인터어스의\n회원이 되어보세요.',
    'login_with_google': '구글로 로그인',
    'login_with_naver': '네이버로 로그인',
    'login_with_kakao': '카카오로 로그인',
    'login_with_apple': '애플로 로그인',
    'not_show_for_24': '24시간 동안 보지 않기',
    'painterus_recaptcha_term':
    '계속 진행하시면 페인터어스의 이용약관 및 개인정보취급방침\nreCAPTCHA에 동의하는 것으로 간주됩니다.',
    'my_colorp': '내 colorP',
    'service_center': '고객센터',
    'setting': '설정',
    'image_download_history': '그림 구매 내역',
    'program_info': '프로그램 정보',
    'logout': '로그아웃',
    'login': '로그인',
    'my_profile': '내 프로필',
  };

  Map<String, String> en = {
    'yes': 'yes',
    'no': 'no',
    'ok': 'ok',
    'cancel': 'cancel',
    'close': 'close',
    'welcome': 'welcome.',
    'next': 'next',
    'email': 'email',
    'password': 'password',
    'password_check': 'password check',
    'password_find': 'Trouble signing in?',
    'password_wrong':
    'The password is invalid or the user does not have password.',
    'later': 'later',
    'login_title': 'Meet PainterUs\nafter login.',
    'sign_up_title': 'Become a member of\nPainterUS',
    'login_with_google': 'login with google',
    'login_with_naver': 'login with naver',
    'login_with_kakao': 'login with kakao',
    'login_with_apple': 'login with apple',
    'not_show_for_24': 'not show for 24 hours',
    'painterus_recaptcha_term':
    'If you continue, you will be considered to agree to Painterus Terms\nand Conditions and Privacy Policy reCAPTCHA.',
    'service_center': 'Support',
    'setting': 'setting',
    'image_download_history': 'Picture purchase history',
    'program_info': 'Program Info',
    'logout': 'Logout',
    'login': 'Login',
    'my_profile': 'My Profile',
  };
}