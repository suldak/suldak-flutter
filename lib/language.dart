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
    'welcome': '환영해요',
    'welcome_nickname_tail': '님!',
    'welcome_nickname_thanks': '친구가 되어주셔서 감사합니다',
    'go_to_my_profile': '내 프로필 보러가기',
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
    'identity_verification_recommend': '본인인증으로 프로필을 완성해보세요!',
    'introduce_me': '나는 어떤 술친구인지 짧게 소개해주세요!',
    'introduce_me_hint': '예시) 조용하고 분위기 있는 곳에서 술을 즐기는 00입니다. 3~4명 정도 소규모로 술닥술닥 이야기 나누며 술 마시고 싶어요~',
    'profile_setting': '프로필 설정',
    'change_personal_info': '개인정보 변경',
    'identity_verification': '본인 인증 하기',
    'notification_setting': '알림 설정',
    'block_manage': '차단 사용자 관리',
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
    'input_password': '비밀번호를 입력해주세요',
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
    'unblock': '해제',
    'want_to_logout': '로그아웃 하시겠어요?',
    'withdraw_title': '&&님과의 이별이라니...\n정말 아쉬워요😢',
    'withdraw_sub_title': '탈퇴를 진행하시기 전에, 몇 가지 확인해야 할 것들이 있어요.',
    'withdraw_warning_1': '모든 활동 정보(프로필, 닉네임, 알콜도수, 댓글, 좋아요, 모임 참여 내역 등)은 탈퇴와 동시에 바로 삭제되며, 삭제된 데이터는 복구할 수 없습니다.',
    'withdraw_warning_2': '부정적인 방법으로 서비스가 이용되는 것을 방지하기 위해, 탈퇴 후 14일 동안 술닥술닥에 다시 가입하실 수 없어요.',
    'withdraw_warning_3': '현재 참여하고 있거나 주최하고 있는 술모임이 있다면 탈퇴하실 수 없습니다.',
    'withdraw_warning_4_head': '회원님이 남기신 모든 데이터는 탈퇴와 동시에',
    'withdraw_warning_4_body': ' 삭제되고, 탈퇴후 14일 동안 재가입이 불가합니다.',
    'withdraw_warning_4_tail': '',
    'withdraw_agree': '위의 안내사항을 모두 확인하였으며, 이에 동의합니다.',
    'withdraw_survey': '&&님이 탈퇴 하시려는\n이유가 궁금해요',
    'withdraw_survey_no_desired_search_result': '검색했을 때 원하는 결과가 나오지 않아요',
    'withdraw_survey_no_desired_story_group': '원하는 이야기 모임이 없어요',
    'withdraw_survey_no_desired_region_group': '원하는 지역의 모임이 없어요',
    'withdraw_survey_unpleasant_user': '부적절하거나 불쾌한 이용자를 만났어요',
    'withdraw_survey_uncomfortable_service': '서비스 이용이 불편해요',
    'withdraw_survey_no_desired_function': '원하는 기능이 없어요',
    'withdraw_survey_not_satisfied_service': '서비스 운영에 아쉬운 부분이 있어요',
    'withdraw_survey_complain_hint': '기타 불만사항이나 바라는 점이 있으시면 알려주세요.',
    'withdraw_cancel': '아직 이별은 이른 것 같아요! 다음에 할게요',
    'withdraw_final_question': '&&님, 정말 이별인가요?🥺',
    'connected_account': '연결된 계정',
    'reset_password': '비밀번호 재설정',
    'identity_verification_content_head': '술닥술닥의 모든 서비스를\n이용하기 위해서는',
    'identity_verification_content_body': '본인인증이 필요해요',
    'identity_verification_content_tail': '',
    'search_your_drink':'원하는 술을 바로 검색해보세요!',
    'recommend_title_text': '님!\n오늘은 이런 술 어떠신가요?',
    'similar_drink_recent_search': '최근에 찾아본 술과 비슷한 술이에요!',
    'new_drinks': '요즘 새로나온 핫한 술!',
    'more': '더보기',
    'suldak_story': '술닥술닥 이야기',
    'about_suldak': '술닥술닥 소개',
    'ad_partner_inquiry': '광고/제휴 문의',
    'inquire': '문의하기',
    'privacy_policy': '개인정보처리방침',
    'back': '이전',
    'my_meeting': '내 모임',
    'all_meetings': '모임 모아보기',
    'my_record': '나의 모임 기록',
    'meetings_i_created': '내가 만든 모임',
    'create_meeting_now': '지금 모임 만들기',
    'confirmed_meeting': '참여 확정 모임',
    'waiting_meeting': '대기 중인 모임',
    'no_meetings_i_created': '내가 만든 모임이 없어요\n지금 모임을 만들어볼까요?',
    'no_confirmed_meeting': '참여할 모임이 없어요',
    'no_waiting_meeting': '승인을 기다리고 있는 모임이 없어요',
    'meeting': '모임',
    'meeting_confirm': '확정',
    'meeting_wait': '대기중',
    'meeting_refuse': '거절됨',
    'meeting_cancel': '취소',
    'meeting_finish': '완료',
    'meeting_wait_finish': '완료대기',
    'order_new': '최신순',
    'order_old': '오래된순',
    'filter': '필터',
    'confirmed_finished_meeting': '참여 완료 모임',
    'no_meeting_record': '아직 모임 기록이 없어요',
    'reset': '초기화',
    'apply_filter': '필터 적용하기',
    'meeting_date': '모임일',
    'meeting_method': '모임 방식',
    'meeting_category': '카테고리',
    'entire_period': '전체기간',
    'find_my_buddy': '마음 맞는 술친구 찾기',
    'hot_story_now': '지금 인기있는 이야기',
    'recommend': '추천합니다!',
    'new_stories': '새로운 이야기',
    'meeting_calendar': '모임 캘린더',
    'if_no_meeting_looking_for': '찾고있는 이야기가 없다면?',
    'create_your_own': '새로운 모임을 직접 만들어봐요!',
    'create_meeting': '모임 만들기',
    'my_meetings': '내 모임',
    'report_inquiry': '신고/문의하기',
    'redirect_to_kakao_inquirt': '카카오톡 문의하기로 연결됩니다',

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

    //banner
    'banner_title' : '공지사항',
    'password_not_complete': '비밀번호가 조건을 만족하지 못했습니다',
    'nickname_too_short': '닉네임이 너무 짧습니다',
    'enter_right_email': '올바른 이메일을 입력해주세요',
    'password_not_match': '비밀번호가 일치하지 않습니다',

    // notify
    'notify': '알림',
    'notify_no_notification': '아직 받은 알림이 없어요👀\n조금만 기다려주세요!',
    'duplicated_nickname': '중복된 닉네임입니다',
    'login_again': '다시 로그인해주세요',
  };

  Map<String, String> en = {
    'yes': 'yes',
    'no': 'no',
    'ok': 'ok',
    'cancel': 'cancel',
    'close': 'close',
    'welcome': 'welcome',
    'welcome_nickname_tail': '!',
    'welcome_nickname_thanks': 'Thank you for being friend',
    'go_to_my_profile': 'Go to my Profile',
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
    'identity_verification_recommend': 'Complete your profile with identity-verification!',
    'introduce_me': 'Introduce me!',
    'introduce_me_hint': 'ex) I am OOO who enjoys drinking in a quiet and atmospheric place. I want to have a small group of 3 or 4 people chat and drink~',
    'profile_setting': 'profile setting',
    'change_personal_info': 'change personal info',
    'identity_verification': 'self certification',
    'notification_setting': 'notification setting',
    'block_manage': 'mange blocked user',
    'report': 'report',
    'inquiry': 'inquiry',
    'app_version': 'app version ',
    'withdraw': 'Withdraw',
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
    'unblock': 'Unblock',
    'want_to_logout': 'Would you like to log out?',
    'withdraw_title': 'Farewell to &&...\nI\'m really sad 😢',
    'withdraw_sub_title': 'Before proceeding with the withdrawal, there are a few things to check.',
    'withdraw_warning_1': 'All activity information (profile, nickname, alcohol level, comments, likes, meeting participation history, etc.) will be deleted immediately upon leaving, and deleted data cannot be recovered.',
    'withdraw_warning_2': 'In order to prevent the service from being used in a negative way, you will not be allowed to re-register for 14 days after leaving.',
    'withdraw_warning_3': 'If you are currently participating or have a drinking party you are hosting, you cannot leave.',
    'withdraw_warning_4_head': '',
    'withdraw_warning_4_body': 'You will not be able to rejoin for 14 days after withdrawal and all data left by you will be deleted',
    'withdraw_warning_4_tail': ' at the same time as withdrawal.',
    'withdraw_agree': 'I have checked all of the above instructions and agree to this.',
    'withdraw_survey': 'We want to know why\n&& wants to leave',
    'withdraw_survey_no_desired_search_result': 'Can\'t get the results I want when I search',
    'withdraw_survey_no_desired_story_group': 'No story groups I want',
    'withdraw_survey_no_desired_region_group': 'No groups at region I want',
    'withdraw_survey_unpleasant_user': 'I met an inappropriate or unpleasant user',
    'withdraw_survey_uncomfortable_service': 'It\'s inconvenient to use the service',
    'withdraw_survey_no_desired_function': 'There\'s no function I want',
    'withdraw_survey_not_satisfied_service': 'There\'s something missing about the service operation',
    'withdraw_survey_complain_hint': 'Please let us know if you have any other complaints or requests.',
    'withdraw_cancel': 'I think it\'s too early to say goodbye! I\'ll do it next time.',
    'withdraw_final_question': '&&, is this really a breakup? 🥺',
    'connected_account': 'Connected Account',
    'reset_password': 'Reset Password',
    'identity_verification_content_head': '',
    'identity_verification_content_body': 'Identity Verification is required',
    'identity_verification_content_tail': 'to use every services of Suldak-Suldak',
    'search_your_drink':'Search your drink!',
    'recommend_title_text': '!\nHow about these drink today?',
    'similar_drink_recent_search': 'Drinks similar to a recent search',
    'new_drinks': 'New drinks came out recently!',
    'more': 'more',
    'suldak_story': 'Suldak story',
    'about_suldak': 'About suldak suldak',
    'ad_partner_inquiry': 'Ad/Partnership',
    'inquire': 'Inquire',
    'privacy_policy': 'Privacy Policy',
    'back': 'Back',
    'my_meeting': 'My Meeting',
    'all_meetings': 'All Meetings',
    'my_record': 'My record',
    'meetings_i_created': 'Meetings I Created',
    'create_meeting_now': 'Create Meeting Now',
    'confirmed_meeting': 'Confirmed Meeting',
    'waiting_meeting': 'Waiting Meeting',
    'no_meetings_i_created': 'No Meetings I Created\nWant to Create one?',
    'no_confirmed_meeting': 'No Meetings to Go',
    'no_waiting_meeting': 'No Meetings Waiting for confirm',
    'meeting': 'Meeting',
    'meeting_confirm': 'Confirmed',
    'meeting_wait': 'Waiting',
    'meeting_refuse': 'Refused',
    'meeting_cancel': 'Canceled',
    'meeting_finish': 'Finished',
    'meeting_wait_finish': 'Waiting Finish',
    'order_new': 'Latest',
    'order_old': 'Earliest',
    'filter': 'Filter',
    'confirmed_finished_meeting': 'Confirmed Finished Meeting',
    'no_meeting_record': 'There\'s no meeting history',
    'reset': 'Reset',
    'apply_filter': 'Apply Filter',
    'entire_period': 'Entire Period',
    'find_my_buddy': 'Find My Buddy',
    'hot_story_now': 'Hot Story Now',
    'recommend': 'Recommend!',
    'new_stories': 'New Stories',
    'meeting_calendar': 'Meeting Calendar',
    'create_meeting': 'Create Meeting',
    'my_meetings': 'My Meetings',
    'report_inquiry': 'Report/inquiry',
    'redirect_to_kakao_inquirt': 'Redirect to kakaotalk inquiry',

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
    'meeting_date': 'Date',
    'meeting_method': 'Method',
    'meeting_category': 'Category',
    'if_no_meeting_looking_for': 'If there\'s no stories looking for?',
    'create_your_own': 'Create one by your own!',

    //banner
    'banner_title' : 'Notice',
    'password_not_complete': 'password is not completed',
    'nickname_too_short': 'nickname is too short',
    'enter_right_email': 'Enter a valid email',
    'password_not_match': 'Password does not match',

    // notify
    'notify': 'Notify',
    'notify_no_notification': 'There are no notifications yet👀\nPlease wait a little longer!',
    'duplicated_nickname': 'duplicated nickname',
    'login_again': 'Please log in again',
  };
}