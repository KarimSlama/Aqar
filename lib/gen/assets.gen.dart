/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/facebook.svg
  String get facebook => 'assets/icons/facebook.svg';

  /// File path: assets/icons/google.svg
  String get google => 'assets/icons/google.svg';

  /// List of all assets
  List<String> get values => [facebook, google];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/house.png
  AssetGenImage get house => const AssetGenImage('assets/images/house.png');

  /// File path: assets/images/house2.png
  AssetGenImage get house2 => const AssetGenImage('assets/images/house2.png');

  /// File path: assets/images/house3.png
  AssetGenImage get house3 => const AssetGenImage('assets/images/house3.png');

  /// File path: assets/images/house4.png
  AssetGenImage get house4Png =>
      const AssetGenImage('assets/images/house4.png');

  /// File path: assets/images/house4.svg
  String get house4Svg => 'assets/images/house4.svg';

  /// File path: assets/images/house5.png
  AssetGenImage get house5Png =>
      const AssetGenImage('assets/images/house5.png');

  /// File path: assets/images/house5.svg
  String get house5Svg => 'assets/images/house5.svg';

  /// File path: assets/images/house6.png
  AssetGenImage get house6 => const AssetGenImage('assets/images/house6.png');

  /// File path: assets/images/house7.png
  AssetGenImage get house7 => const AssetGenImage('assets/images/house7.png');

  /// File path: assets/images/login_img.svg
  String get loginImg => 'assets/images/login_img.svg';

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/splash_bg_image.png
  AssetGenImage get splashBgImage =>
      const AssetGenImage('assets/images/splash_bg_image.png');

  /// List of all assets
  List<dynamic> get values => [
    house,
    house2,
    house3,
    house4Png,
    house4Svg,
    house5Png,
    house5Svg,
    house6,
    house7,
    loginImg,
    logo,
    splashBgImage,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
