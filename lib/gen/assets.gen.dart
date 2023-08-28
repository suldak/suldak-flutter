/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

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

class Assets {
  Assets._();

  static const $AssetsFontGen font = $AssetsFontGen();
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
