// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_icons.dart';

// **************************************************
// ResIconsGenerator
// **************************************************

abstract class AppIcons {
  const AppIcons._();

  static const list = <String>[];
}

extension ExtensionAppIcons on SvgPicture {
  SvgPicture copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    ColorFilter? colorFilter,
  }) {
    return SvgPicture.asset(
      path,
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      colorFilter: colorFilter ?? this.colorFilter,
    );
  }

  String get path => (this.bytesLoader as SvgAssetLoader).assetName;
}
