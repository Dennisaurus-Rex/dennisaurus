import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class Images {
  static const String logo = 'assets/images/logo.png';
}

enum ImageKey {
  dart('dart'),
  swift('swift'),
  kotlin('kotlin'),
  typescript('ts'),
  firebase('firebase'),
  gcp('cloud'),
  flutter('flutter'),
  androidStudio('android_studio'),
  vsCode('vsc'),
  xcode('xcode'),
  ;

  final String name;
  const ImageKey(this.name);

  bool get _brightnessAdjusted {
    switch (this) {
      case ImageKey.vsCode:
      case ImageKey.xcode:
      case ImageKey.androidStudio:
      case ImageKey.flutter:
      case ImageKey.firebase:
      case ImageKey.gcp:
      case ImageKey.dart:
      case ImageKey.swift:
      case ImageKey.kotlin:
      case ImageKey.typescript:
        return false;
    }
  }

  String assetName(bool darkmode) {
    if (!_brightnessAdjusted) return 'images/$name';
    return 'images/$name${darkmode ? '_dark' : '_light'}';
  }
}

class SvgImage extends ImageWidget {
  const SvgImage(
    super.imageKey, {
    super.key,
    super.height,
    super.width,
    super.boxfit,
    super.padding,
  });

  @override
  Widget imageBuilder(BuildContext context) {
    return SvgPicture.asset(
      '${imageKey.assetName(context.theme.brightness == Brightness.dark)}.svg',
      width: width,
      height: height,
      fit: boxfit ?? BoxFit.contain,
    );
  }
}

class PngImage extends ImageWidget {
  const PngImage(
    super.imageKey, {
    super.key,
    super.height,
    super.width,
    super.boxfit,
    super.padding,
  });

  @override
  Widget imageBuilder(BuildContext context) {
    return Image.asset(
      '${imageKey.assetName(context.theme.brightness == Brightness.dark)}.png',
      width: width,
      height: height,
      fit: boxfit,
    );
  }
}

abstract class ImageWidget extends StatelessWidget {
  final ImageKey imageKey;
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final EdgeInsets? padding;

  Widget imageBuilder(BuildContext context);

  const ImageWidget(
    this.imageKey, {
    super.key,
    this.height,
    this.width,
    this.boxfit,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: imageBuilder(context),
    );
  }
}
