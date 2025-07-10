// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_images.dart';

// **************************************************
// ResImagesGenerator
// **************************************************

abstract class AppImages {
  const AppImages._();

  static final splash = Image.asset('assets/images/splash.png');

  static const list = <String>['assets/images/splash.png'];
}

extension ExtensionAppImages on Image {
  Image copyWith({double? width, double? height, BoxFit? fit, Color? color}) {
    return Image(
      image: image,
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      color: color ?? this.color,
    );
  }

  String get path => (this.image as AssetImage).assetName;
}
