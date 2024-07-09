import 'package:dennisaurus_dev/utils/build_context_functional.dart';
import 'package:flutter/material.dart';

abstract class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.mediaQueryWidth;

    if (screenWidth < smallWidth) {
      return buildSmall(context);
    } else {
      return buildLarge(context);
    }
  }

  Widget buildLarge(BuildContext context);

  Widget buildSmall(BuildContext context);

  double get smallWidth => 600;
}
