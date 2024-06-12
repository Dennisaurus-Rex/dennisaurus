import 'package:flutter/foundation.dart';

abstract class CharCodes {
  static const String sup2 = '\u00B2';
}

bool get kIsMobileWeb => kIsWeb && isIOS || isAndroid;

bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
