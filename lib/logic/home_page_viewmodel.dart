import 'package:dennisaurus_dev/logic/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluvvm/fluvvm.dart';

class HomePageViewmodel extends Viewmodel<HomePageState, HomePageIntent> {
  // final ThemeCoordinator _themeCoordinator = ThemeCoordinator();
  // ThemeData get currentTheme => _themeCoordinator.currentTheme;

  @override
  void onBound() {
    setState(HomePageState.normal);
  }

  @override
  void raiseIntent(HomePageIntent intent, {Object? data}) {
    switch (intent) {
      case HomePageIntent.showThemePicker:
        showThemePicker(context, (theme) {
          // _themeCoordinator.setTheme(theme);
          Navigator.of(context).pop();
          setState(HomePageState.normal);
        });
        break;
      case HomePageIntent.closeThemePicker:
        // setState(HomePageState.normal);
        break;
    }
  }

  void fabOpenChanged(bool isOpen) {
    setState(
      isOpen ? HomePageState.dimmed : HomePageState.normal,
    );
  }
}

enum HomePageState with FluvvmState {
  normal,
  dimmed,
}

enum HomePageIntent with FluvvmIntent {
  showThemePicker,
  closeThemePicker,
}
