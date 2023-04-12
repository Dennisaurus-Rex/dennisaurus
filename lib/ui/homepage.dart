import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/ui/info_page.dart';
import 'package:dennisaurus_dev/ui/slide_out_theme_picker.dart';
import 'package:dennisaurus_dev/ui/theme_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum LayoutSize {
  small,
  medium,
  large,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LayoutSize _layoutSize = LayoutSize.large;

  Widget get _resolvedLayout {
    if (_layoutSize == LayoutSize.small) {
      return const _SmallLayout();
    } else if (_layoutSize == LayoutSize.medium) {
      return const _MediumLayout();
    } else {
      return const _LargeLayout();
    }
  }

  PreferredSizeWidget? get _appBar {
    switch (_layoutSize) {
      case LayoutSize.large:
        return null;
      case LayoutSize.medium:
      case LayoutSize.small:
        return AppBar(
          title: const Text('dennisaurus.dev'),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.brush),
              onPressed: () {
                showModalBottomSheet(
                  clipBehavior: Clip.hardEdge,
                  context: context,
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ThemePickerWidget(),
                  ),
                );
              },
            ),
          ],
        );
    }
  }

  void _setLayoutSize(Size windowSize) {
    if (windowSize.width < 650) {
      _layoutSize = LayoutSize.small;
    } else if (windowSize.width < 1170 || windowSize.height < 740) {
      _layoutSize = LayoutSize.medium;
    } else {
      _layoutSize = LayoutSize.large;
    }
  }

  @override
  Widget build(BuildContext context) {
    _setLayoutSize(context.mediaQuery.size);

    return Scaffold(
      appBar: _appBar,
      body: _resolvedLayout,
    );
  }
}

class _SmallLayout extends StatelessWidget {
  const _SmallLayout();

  @override
  Widget build(BuildContext context) {
    return const InfoWidget(
      displaySmall: true,
    );
  }
}

class _MediumLayout extends StatelessWidget {
  const _MediumLayout();

  @override
  Widget build(BuildContext context) {
    return const InfoWidget();
  }
}

class _LargeLayout extends StatelessWidget {
  const _LargeLayout();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.fromSize(
          size: context.mediaQuery.size,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                child: InfoWidget(),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  children: [
                    Text(
                      'Pick a theme, would ya?',
                      style: context.theme.textTheme.displayLarge,
                    ),
                    const FaIcon(FontAwesomeIcons.chevronDown)
                  ],
                ),
              ),
              SizedBox.fromSize(
                size: Size(116, context.mediaQuery.size.height),
              )
            ],
          ),
        ),
        const SlideOutThemePicker(
          margin: 100,
        ),
      ],
    );
  }
}
