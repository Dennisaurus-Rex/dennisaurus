import 'package:flutter/material.dart';

extension Functional on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;
  double get mediaQueryWidth => MediaQuery.of(this).size.width;
  double get mediaQueryHeight => MediaQuery.of(this).size.height;
}
