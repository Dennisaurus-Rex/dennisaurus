import 'package:dennisaurus_dev/debug/debug_conditions.dart';
import 'package:dennisaurus_dev/debug/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:fluvvm/fluvvm.dart';

bool kDebugLightMode = ThemeMode.system == ThemeMode.light;
ThemeMode get kDebugBrightness =>
    kDebugLightMode ? ThemeMode.light : ThemeMode.dark;

mixin Debugable {
  DebugType get debugType {
    if (this is Widget) return DebugType.widget;
    if (this is Viewmodel) return DebugType.viewmodel;
    if (this is NetworkRequest) return DebugType.network;
    return DebugType.model;
  }
}

enum DebugType {
  widget,
  viewmodel,
  model,
  network,
}

extension PrintDebug on Debugable {
  void printDebug(Object message) {
    bool condition = false;

    switch (debugType) {
      case DebugType.widget:
        condition = kDebugWidget;
        break;
      case DebugType.viewmodel:
        condition = kDebugViewmodel;
        break;
      case DebugType.model:
        condition = kDebugModel;
        break;
      case DebugType.network:
        condition = kDebugNetwork;
        break;
    }

    conditionedPrint(
      message: message,
      tag: tag,
      conditioned: condition,
    );
  }
}
