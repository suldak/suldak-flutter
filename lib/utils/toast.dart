import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

/// ## Usage
/// 토스트를 표시하는 경우, static method 인 [show]를 사용하여 표시한다. [Get]을 사용하기 때문에
/// 별도의 [Context]는 전달 받지 않으며, 표시하고자 하는 메세지만을 전달하면 사용가능 하다.
class Toast {
  /// Single tone 을 유한 객체
  static final Toast _instance = Toast._();

  /// Single tone 을 받어오는 factory 생성자
  factory Toast.instance() => _instance;

  Toast._();

  /// ### 실제로 표시할 오버레이 엔티티
  static OverlayEntry? _overlayEntry;

  /// ### 토스트가 현제 표시되고 있는지 확인하는 변수
  static bool _isVisible = false;

  /// ### 현재 표시되고 있는 토스트의 타이머
  static Timer? _timer;

  /// ## 토스트 메세지 표시
  /// 특정 문자열을 표시하기 위해 [msg]를 전달받아 오버레이를 표시한다. 이때, 서버로 부터 전달받는 에러
  /// 메세지의 형식은 2줄의 메세지이다. 첫번째 줄은 서버에서 탐지한 금칙어의 리스트이며, 두번째 줄은
  /// 금칙어가 포함되어 등록할 수 없다는 공통적인 문장이다. 따라서 [msg]는 '\n'으로 행 변경이 있는
  /// 문장이어야 한다.
  ///
  /// 또한 [durationSecond]을 통해서 토스트가 표시되는 지속시간을 결정할 수 있다. 기본값은 1이며,
  /// 이는 변수명에서 표시하듯, 초단위의 값이다.
  ///
  /// [preserveCurrent]에 [true]를 전달하면 현재 표시되고 있는 것이 있을때 새로운 토스트 메세지
  /// 요청을 취소하고 띄우는 것이 아니라 기존의 것을 유지시킨다.
  static void show({
    required String msg,
    int durationSecond = 1,
    Alignment align = Alignment.bottomCenter,
    bool preserveCurrent = false,
  }) {
    if (preserveCurrent && _isVisible) {
      return;
    }
    dismiss();
    _overlayEntry = _msgBuilder(msg, align);
    final overlayState = Overlay.of(Get.overlayContext!);

    _isVisible = true;
    overlayState.insert(_overlayEntry!);

    _timer = Timer(Duration(seconds: durationSecond), () {
      dismiss();
    });
  }

  /// ## 토스트 메세지 제거
  static void dismiss() {
    if (!_isVisible) return;

    _isVisible = false;
    _timer?.cancel();
    _timer = null;
    _overlayEntry?.remove();
  }

  /// ## 한줄 짜리 메세지 위젯 빌더
  static OverlayEntry _msgBuilder(String msg, Alignment align) {
    return OverlayEntry(
        builder: (context) => Align(
          alignment: align,
          child: Padding(
            padding: _padding,
            child: IgnorePointer(
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(300),
                      boxShadow: const [BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                      )]
                  ),
                  child: Text(
                    msg,
                    style: const TextStyle(
                      fontSize: 14,
                      letterSpacing: -0.1,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  /// ## 토스트의 패딩값 계산
  /// 하단 정렬인 경우에, 소프트 키패드가 올라와있는지 확인하고 이를 계산해여 추가한다
  static EdgeInsets get _padding {
    double defaultVerticalPadding = Get.height / 5;

    // 소프트 키패드 있는지 확인해서 바텀 패딩 계산
    double bottom;
    final bottomInset = Get.mediaQuery.viewInsets.bottom;
    // 소프트 키패드 올라온 상태
    if (bottomInset != 0) {
      bottom = bottomInset + 70;
    } else {
      bottom = defaultVerticalPadding;
    }

    return EdgeInsets.fromLTRB(
      20,
      defaultVerticalPadding,
      20,
      bottom,
    );
  }
}