import 'package:dennisaurus_dev/models/theme_key.dart';
import 'package:dennisaurus_dev/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';

class ThemeCoordinator {
  final void Function()? onUpdatedTheme;
  String _currentTheme = '';

  ThemeCoordinator({
    this.onUpdatedTheme,
  }) {
    _currentTheme = GetStorage().read('theme') ?? '';
    GetStorage().listenKey('theme', (value) {
      if (value != _currentTheme) {
        _currentTheme = value;
        onUpdatedTheme?.call();
      }
    });
  }

  ThemeData get currentTheme => _theme;
  ThemeData get _theme {
    ThemeData theme = ThemeModel.fromKey(_key).theme;
    return theme;
  }

  ThemeData get themeBySystemBrightness {
    final isDarkMode =
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    return isDarkMode
        ? ThemeModel.fromKey(ThemeKey.darthPurple).theme
        : ThemeModel.fromKey(ThemeKey.purple).theme;
  }

  static ThemeKey get _key {
    String? storedKey = GetStorage().read('theme');
    final isDarkMode =
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    storedKey ??= isDarkMode ? ThemeKey.darthTeal.name : ThemeKey.teal.name;
    return ThemeKey.fromName(storedKey);
  }

  static bool isCurrentTheme(ThemeModel theme) => _key.name == theme.key.name;

  Future<void> setTheme(ThemeModel theme) async {
    await GetStorage().write('theme', theme.key.name);
  }
}
