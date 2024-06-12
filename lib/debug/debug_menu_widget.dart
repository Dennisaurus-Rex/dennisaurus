import 'package:dennisaurus_dev/ui/theme_picker_widget.dart';
import 'package:dennisaurus_dev/debug/theme.dart';
import 'package:flutter/material.dart';

class DebugMenuWidget extends StatefulWidget {
  const DebugMenuWidget({super.key});

  @override
  State<DebugMenuWidget> createState() => _DebugMenuWidgetState();
}

class _DebugMenuWidgetState extends State<DebugMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Menu'),
      ),
      body: CustomScrollView(
        slivers: [
          ThemePickerWidget((theme) {}),
          Theme.of(context).colorScheme.colorPallete,
        ],
      ),
    );
  }
}
