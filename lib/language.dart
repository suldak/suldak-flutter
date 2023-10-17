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
    'skip': '건너뛰기',
    'start': '시작하기',
    'email': '이메일',
    'password': '비밀번호',
    'password_check': '비밀번호 확인',
    'password_find': '비밀번호를 잊으셨나요?',
    'password_wrong': '비밀번호가 유효하지 않거나 사용자에게 비밀번호가 없습니다.',
    'later': '나중에하기',
    'login_with_google': '구글로 로그인',
    'login_with_naver': '네이버로 로그인',
    'login_with_kakao': '카카오로 로그인',
    'login_with_apple': '애플로 로그인',
    'not_show_for_24': '24시간 동안 보지 않기',
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
    'include_english': '영문 포함',
    'include_number': '숫자 포함',
    'between_8_20': '8~20자',
    'input_email': '이메일을 입력해주세요',
    'input_password': '비밀번호 재입력',
    'input_password_check': '비밀번호 재입력',
    'required': '필수',
    'option': '선택',
    'gender': '성별',
    'step2_title': '친구되기 STEP 02',
    'age': '연령',
    'login_kakao': '카카오로 3초만에 시작하기',
    'login_naver': '네이버로 계속하기',
    'login_google': '구글로 계속하기',
    'login_email': '이메일로 로그인',
    'sign_up_email': '이메일로 회원가입',
    'find_password': '비밀번호 찾기',
    'notification': '알림',
    'sound': '소리',
    'vibration': '진동',
    'app_push': '앱 푸시 알림',
    'app_push_desc': '모임 신청, 리마인드 등 서비스 이용 관련 알림',
    'marketing_info_notification': '마케팅 정보 알림',
    'marketing_info_notification_desc': '이벤트, 쿠폰, 프로모션 등 혜택 소식 알림',
    // onboard
    'onboard_first1': '\n지금 나에게 ',
    'onboard_first2': '딱맞는 술',
    'onboard_first3': '을\n추천받을 수 있어요',
    'onboard_second1': '이야기 주제를 선택하고,\n',
    'onboard_second2': '비슷한 술 취향을 가진\n',
    'onboard_second3': '친구와 함께 나눠요',
    'onboard_third1': '\n내가 ',
    'onboard_third2': '직접 모임을 만들거나\n',
    'onboard_third3': '참여할 수 있어요',
    'onboard_last1': '\n',
    'onboard_last2': '나의 술취향은 무엇일까요?\n',
    'onboard_last3': '함께 분석해봐요!\n',
  };

  Map<String, String> en = {
    'yes': 'yes',
    'no': 'no',
    'ok': 'ok',
    'cancel': 'cancel',
    'close': 'close',
    'welcome': 'welcome.',
    'next': 'next',
    'skip': 'skip',
    'start': 'start',
    'email': 'email',
    'password': 'password',
    'password_check': 'password check',
    'password_find': 'Trouble signing in?',
    'password_wrong':
    'The password is invalid or the user does not have password.',
    'later': 'later',
    'login_with_google': 'login with google',
    'login_with_naver': 'login with naver',
    'login_with_kakao': 'login with kakao',
    'login_with_apple': 'login with apple',
    'not_show_for_24': 'not show for 24 hours',
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
    'agree_terms': '(REQ) Accept the Terms and Conditions',
    'agree_personal_info': '(REQ) Agree to collect and use personal info',
    'agree_ad_push': '(OPT) Agree to receive (notify) ad info',
    'include_english': 'contain english',
    'include_number': 'contain number',
    'between_8_20': 'between 8~20 char',
    'input_email': 'enter your email',
    'input_password': 'enter your password',
    'input_password_check': 'enter your password again',
    'required': 'required',
    'option': 'option',
    'gender': 'gender',
    'step2_title': 'Being friends STEP 01',
    'age': 'age',
    'login_kakao': 'login with kakao',
    'login_naver': 'login with naver',
    'login_google': 'login with google',
    'login_email': 'Login with email',
    'sign_up_email': 'Sign up with email',
    'find_password': 'Find password',
    'notification': 'Notification',
    'notification_desc': 'Full notification ON/OFF',
    'sound': 'Sound',
    'vibration': 'Vibration',
    'app_push': 'App Push Notification',
    'app_push_desc': 'Notification of service use, such as meeting application and reminders',
    'marketing_info_notification': 'Marketing Info Notification',
    'marketing_info_notification_desc': 'Notification of benefits such as events, coupons, and promotions',
    // onboard
    'onboard_first1': '\nYou can now get the ',
    'onboard_first2': 'right drink\n',
    'onboard_first3': 'for me.',
    'onboard_second1': 'Select a topic and\n',
    'onboard_second2': 'share it with friends\n',
    'onboard_second3': 'with similar drinking tastes.',
    'onboard_third1': '\nI can ',
    'onboard_third2': 'create or join\n',
    'onboard_third3': 'a meeting.',
    'onboard_last1': '\n',
    'onboard_last2': 'What is my drinking taste?\n',
    'onboard_last3': 'Let\'s analyze it together!\n',
  };
}