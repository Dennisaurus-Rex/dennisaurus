import 'package:flutter/foundation.dart';

bool get kDebugWidget => _kDebugWidget;
bool _kDebugWidget = false;
void toggleDebugWidget(bool value) {
  _kDebugWidget = value && kDebugMode;
}

bool get kDebugViewmodel => _kDebugViewmodel;
bool _kDebugViewmodel = false;
void toggleDebugViewmodel(bool value) {
  _kDebugViewmodel = value && kDebugMode;
}

bool get kDebugModel => _kDebugModel;
bool _kDebugModel = false;
void toggleDebugModel(bool value) {
  _kDebugModel = value && kDebugMode;
}

bool get kDebugNetwork => _kDebugNetwork;
bool _kDebugNetwork = false;
void toggleDebugNetwork(bool value) {
  _kDebugNetwork = value && kDebugMode;
}
