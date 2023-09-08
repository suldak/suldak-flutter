/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontGen {
  const $AssetsFontGen();

  /// File path: assets/font/Pretendard-Black.ttf
  String get pretendardBlack => 'assets/font/Pretendard-Black.ttf';

  /// File path: assets/font/Pretendard-Bold.ttf
  String get pretendardBold => 'assets/font/Pretendard-Bold.ttf';

  /// File path: assets/font/Pretendard-ExtraBold.ttf
  String get pretendardExtraBold => 'assets/font/Pretendard-ExtraBold.ttf';

  /// File path: assets/font/Pretendard-ExtraLight.ttf
  String get pretendardExtraLight => 'assets/font/Pretendard-ExtraLight.ttf';

  /// File path: assets/font/Pretendard-Light.ttf
  String get pretendardLight => 'assets/font/Pretendard-Light.ttf';

  /// File path: assets/font/Pretendard-Medium.ttf
  String get pretendardMedium => 'assets/font/Pretendard-Medium.ttf';

  /// File path: assets/font/Pretendard-Regular.ttf
  String get pretendardRegular => 'assets/font/Pretendard-Regular.ttf';

  /// File path: assets/font/Pretendard-SemiBold.ttf
  String get pretendardSemiBold => 'assets/font/Pretendard-SemiBold.ttf';

  /// File path: assets/font/Pretendard-Thin.ttf
  String get pretendardThin => 'assets/font/Pretendard-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        pretendardBlack,
        pretendardBold,
        pretendardExtraBold,
        pretendardExtraLight,
        pretendardLight,
        pretendardMedium,
        pretendardRegular,
        pretendardSemiBold,
        pretendardThin
      ];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/beer.png
  AssetGenImage get beer => const AssetGenImage('assets/png/beer.png');

  /// File path: assets/png/cocktail.png
  AssetGenImage get cocktail => const AssetGenImage('assets/png/cocktail.png');

  /// File path: assets/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/png/logo.png');

  /// File path: assets/png/night_bridge.png
  AssetGenImage get nightBridge =>
      const AssetGenImage('assets/png/night_bridge.png');

  /// File path: assets/png/pot.png
  AssetGenImage get pot => const AssetGenImage('assets/png/pot.png');

  /// File path: assets/png/thinking_face.png
  AssetGenImage get thinkingFace =>
      const AssetGenImage('assets/png/thinking_face.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [beer, cocktail, logo, nightBridge, pot, thinkingFace];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/arrow_back.svg
  SvgGenImage get arrowBack => const SvgGenImage('assets/svg/arrow_back.svg');

  /// File path: assets/svg/arrow_next.svg
  SvgGenImage get arrowNext => const SvgGenImage('assets/svg/arrow_next.svg');

  /// File path: assets/svg/camera.svg
  SvgGenImage get camera => const SvgGenImage('assets/svg/camera.svg');

  /// File path: assets/svg/check.svg
  SvgGenImage get check => const SvgGenImage('assets/svg/check.svg');

  /// File path: assets/svg/find_friend.svg
  SvgGenImage get findFriend => const SvgGenImage('assets/svg/find_friend.svg');

  /// File path: assets/svg/find_friend_tap.svg
  SvgGenImage get findFriendTap =>
      const SvgGenImage('assets/svg/find_friend_tap.svg');

  /// File path: assets/svg/google.svg
  SvgGenImage get google => const SvgGenImage('assets/svg/google.svg');

  /// File path: assets/svg/home.svg
  SvgGenImage get home => const SvgGenImage('assets/svg/home.svg');

  /// File path: assets/svg/home_tap.svg
  SvgGenImage get homeTap => const SvgGenImage('assets/svg/home_tap.svg');

  /// File path: assets/svg/info.svg
  SvgGenImage get info => const SvgGenImage('assets/svg/info.svg');

  /// File path: assets/svg/kakao.svg
  SvgGenImage get kakao => const SvgGenImage('assets/svg/kakao.svg');

  /// File path: assets/svg/my_history.svg
  SvgGenImage get myHistory => const SvgGenImage('assets/svg/my_history.svg');

  /// File path: assets/svg/my_history_tap.svg
  SvgGenImage get myHistoryTap =>
      const SvgGenImage('assets/svg/my_history_tap.svg');

  /// File path: assets/svg/my_page.svg
  SvgGenImage get myPage => const SvgGenImage('assets/svg/my_page.svg');

  /// File path: assets/svg/my_page_tap.svg
  SvgGenImage get myPageTap => const SvgGenImage('assets/svg/my_page_tap.svg');

  /// File path: assets/svg/naver.svg
  SvgGenImage get naver => const SvgGenImage('assets/svg/naver.svg');

  /// File path: assets/svg/not_defined.svg
  SvgGenImage get notDefined => const SvgGenImage('assets/svg/not_defined.svg');

  /// File path: assets/svg/not_defined_tap.svg
  SvgGenImage get notDefinedTap =>
      const SvgGenImage('assets/svg/not_defined_tap.svg');

  /// File path: assets/svg/user.svg
  SvgGenImage get user => const SvgGenImage('assets/svg/user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arrowBack,
        arrowNext,
        camera,
        check,
        findFriend,
        findFriendTap,
        google,
        home,
        homeTap,
        info,
        kakao,
        myHistory,
        myHistoryTap,
        myPage,
        myPageTap,
        naver,
        notDefined,
        notDefinedTap,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontGen font = $AssetsFontGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
