import 'package:dennisaurus_dev/models/theme_model.dart';
import 'package:dennisaurus_dev/ui/theme_picker_widget.dart';
import 'package:flutter/material.dart';

void showThemePicker(
  BuildContext context,
  void Function(ThemeModel theme) onThemeChanged,
) {
  showDialog(
    // clipBehavior: Clip.hardEdge,
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 600,
          maxHeight: 600,
        ),
        child: ThemePickerWidget(onThemeChanged),
      ),
    ),
  );
}
