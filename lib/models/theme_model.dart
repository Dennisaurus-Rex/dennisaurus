import 'package:dennisaurus_dev/logic/theme_coordinator.dart';
import 'package:dennisaurus_dev/models/theme_key.dart';
import 'package:flutter/material.dart';

class ThemeModel {
  const ThemeModel._(
    this.key, {
    required this.seed,
    bool darkTheme = false,
  }) : brightness = darkTheme ? Brightness.dark : null;

  factory ThemeModel.fromKey(ThemeKey key) {
    switch (key) {
      case ThemeKey.teal:
        return ThemeModel._(
          key,
          seed: Colors.teal,
        );
      case ThemeKey.darthTeal:
        return ThemeModel._(
          key,
          seed: Colors.teal,
          darkTheme: true,
        );
      // case ThemeKey.orange:
      //   return ThemeModel._(
      //     key,
      //     seed: Colors.limeAccent,
      //   );
      // case ThemeKey.darthOrange:
      //   return ThemeModel._(
      //     key,
      //     seed: Colors.limeAccent,
      //     darkTheme: true,
      //   );
      case ThemeKey.pink:
        return ThemeModel._(
          key,
          seed: Colors.pink,
        );
      case ThemeKey.darthPink:
        return ThemeModel._(
          key,
          seed: Colors.pink,
          darkTheme: true,
        );
      case ThemeKey.purple:
        return ThemeModel._(
          key,
          seed: Colors.purple,
        );
      case ThemeKey.darthPurple:
        return ThemeModel._(
          key,
          seed: Colors.purple,
          darkTheme: true,
        );
      case ThemeKey.blue:
        return ThemeModel._(
          key,
          seed: Colors.blue,
        );
      case ThemeKey.darthBlue:
        return ThemeModel._(
          key,
          seed: Colors.blue,
          darkTheme: true,
        );
      case ThemeKey.green:
        return ThemeModel._(
          key,
          seed: Colors.green,
        );
      case ThemeKey.darthGreen:
        return ThemeModel._(
          key,
          seed: Colors.green,
          darkTheme: true,
        );
      case ThemeKey.red:
        return ThemeModel._(
          key,
          seed: Colors.red,
        );
      case ThemeKey.darthRed:
        return ThemeModel._(
          key,
          seed: Colors.red,
          darkTheme: true,
        );
    }
  }

  factory ThemeModel.next() {
    int nextIndex = ThemeKey.values.indexOf(ThemeCoordinator.currentKey) + 1;
    if (nextIndex >= ThemeKey.values.length) {
      nextIndex = 0;
    }

    final nextKey = ThemeKey.values[nextIndex];

    return ThemeModel.fromKey(nextKey);
  }

  factory ThemeModel.previous() {
    int previousIndex =
        ThemeKey.values.indexOf(ThemeCoordinator.currentKey) - 1;
    if (previousIndex < 0) {
      previousIndex = ThemeKey.values.length - 1;
    }

    final previousKey = ThemeKey.values[previousIndex];

    return ThemeModel.fromKey(previousKey);
  }

  final Color seed;
  final Brightness? brightness;
  final ThemeKey key;

  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seed,
        brightness: brightness,
        fontFamily: 'MPLUS1Code',
      );
}
