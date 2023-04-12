import 'package:dennisaurus_dev/debug/theme.dart';
import 'package:flutter/material.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).colorScheme.colorPallete;
  }
}
