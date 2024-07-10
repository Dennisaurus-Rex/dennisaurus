import 'package:dennisaurus_dev/logic/theme_coordinator.dart';
import 'package:dennisaurus_dev/models/theme_key.dart';
import 'package:flutter/material.dart';

class ThemeModel {
  const ThemeModel._(
    this.key, {
    bool darkTheme = false,
  }) : brightness = darkTheme ? Brightness.dark : null;

  factory ThemeModel.fromKey(ThemeKey key) => ThemeModel._(key);

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

  final Brightness? brightness;
  final ThemeKey key;

  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: key.color,
        // brightness: brightness,
        fontFamily: 'MPLUS1Code',
      );
}
