import 'package:flutter/material.dart';

extension Inverted on Color {
  Color get inverted => Color.fromARGB(
        alpha,
        255 - red,
        255 - green,
        255 - blue,
      );
  Color get contrast => Color.fromARGB(
        255,
        red > 127 ? 0 : 255,
        green > 127 ? 0 : 255,
        blue > 127 ? 0 : 255,
      );

  Color get contrastAsBlackOrWhite {
    final bool bright = computeLuminance() > 0.5;
    return bright ? Colors.black : Colors.white;
  }
}
