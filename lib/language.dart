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
    'alcohol_level': '알콜 도수',
    'profile_completion': '프로필 완성도 ',
    'self_certification_recommend': '본인인증으로 프로필을 완성해보세요!',
    'introduce_me': '나는 어떤 술친구인지 짧게 소개해주세요!',
    'introduce_me_hint': '예시) 조용하고 분위기 있는 곳에서 술을 즐기는 00입니다. 3~4명 정도 소규모로 술닥술닥 이야기 나누며 술 마시고 싶어요~',
    'profile_setting': '프로필 설정',
    'change_personal_info': '개인정보 변경',
    'self_certification': '본인 인증 하기',
    'notification_setting': '알림 설정',
    'block_manage': '차단유저 관리',
    'report': '신고하기',
    'inquiry': '문의하기',
    'app_version': '앱 버전 ',
    'withdraw': '탈퇴하기',
    'terms_and_conditions': '이용약관',
    'my_drink_taste': '내 술 취향은 이것!',
    'prefer_mood': '저는 00한 분위기에서 마시는 걸 좋아해요',
    'my_snack_taste': '제 안주 취향은요...',
    'save_changes': '수정사항 저장하기',
    'manage_my_account': '내 계정 관리',
    'nickname': '닉네임',
    'prev_nickname': '이전 닉네임',
    'duplication_check': '중복확인',
    'save': '저장하기',
    'male': '남성',
    'female': '여성',
    'like_all': '다 좋아해요!',
    'prefer_alcohol_flavor': '선호하는 술 맛이 있다면?',
    'alcohol_capacity': '솔직히 말씀드리면 제 주량은...(소주 기준)',
    'find_friend': '친구 찾기',
    'not_defined': '미정',
    'home': '홈',
    'my_history': '내 기록',
    'my_page': '마이페이지',
    'input_nickname': '닉네임을 입력해주세요',
    'step1_title': '친구되기 STEP 01',
    'agree_all': '전체동의',
    'agree_terms': '(필수)이용약관에 동의',
    'agree_personal_info': '(필수)개인정보 수집 및 이용에 동의',
    'agree_ad_push': '(선택)광고성 정보 수신(알림)에 동의',
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
    'alcohol_level': 'alcohol level',
    'profile_completion': 'Profile Completion ',
    'self_certification_recommend': 'Complete your profile with self-certification!',
    'introduce_me': 'Introduce me!',
    'introduce_me_hint': 'ex) I am OOO who enjoys drinking in a quiet and atmospheric place. I want to have a small group of 3 or 4 people chat and drink~',
    'profile_setting': 'profile setting',
    'change_personal_info': 'change personal info',
    'self_certification': 'self certification',
    'notification_setting': 'notification setting',
    'block_manage': 'mange blocked user',
    'report': 'report',
    'inquiry': 'inquiry',
    'app_version': 'app version ',
    'withdraw': 'withdraw',
    'terms_and_conditions': 'Terms and Conditions',
    'my_drink_taste': 'My drink taste!',
    'prefer_mood': 'I like to drink in a 00 atmosphere',
    'my_snack_taste': 'My snack preference is...',
    'save_changes': 'Save changes',
    'manage_my_account': 'Manage my account',
    'nickname': 'nickname',
    'prev_nickname': 'previous nickname',
    'duplication_check': 'check',
    'save': 'save',
    'male': 'male',
    'female': 'female',
    'like_all': 'I like them all!',
    'prefer_alcohol_flavor': 'What\'s your favorite alcohol flavor?',
    'alcohol_capacity': 'To be honest, my drinking capacity is...(Based on soju)',
    'find_friend': 'friend',
    'not_defined': 'no',
    'home': 'home',
    'my_history': 'history',
    'my_page': 'profile',
    'input_nickname': 'enter your nickname',
    'step1_title': 'Being friends STEP 01',
    'agree_all': 'Agree all',
    'agree_terms': '(Required) Accept the Terms and Conditions',
    'agree_personal_info': '(Required) Agree to collect and use personal information',
    'agree_ad_push': '(Optional) Agree to receive (notify) advertising information',
  };
}