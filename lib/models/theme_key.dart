import 'dart:math';

import 'package:flutter/material.dart';

enum ThemeKey {
  teal('teal'),
  // darthTeal('darth teal'),
  // orange('orange'),
  // darthOrange('darth orange'),
  pink('pink'),
  // darthPink('darth pink'),
  purple('purple'),
  // darthPurple('darth purple'),
  blue('blue'),
  // darthBlue('darth blue'),
  green('green'),
  // darthGreen('darth green'),
  red('red'),
  // darthRed('darth red');
  ;

  final String name;

  const ThemeKey(this.name);

  factory ThemeKey.fromName(String name) {
    return ThemeKey.values.firstWhere((e) => e.name == name);
  }

  factory ThemeKey.random() {
    return ThemeKey.values[Random().nextInt(ThemeKey.values.length)];
  }

  factory ThemeKey.randomExcept(ThemeKey key) {
    final keys = ThemeKey.values.where((e) => e != key).toList();
    return keys[Random().nextInt(keys.length)];
  }

  Color get color => switch (this) {
        ThemeKey.teal => Colors.teal,
        ThemeKey.pink => Colors.pink,
        ThemeKey.purple => Colors.purple,
        ThemeKey.blue => Colors.blue,
        ThemeKey.green => Colors.green,
        ThemeKey.red => Colors.red,
      };
}
