import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/logic/theme_coordinator.dart';
import 'package:dennisaurus_dev/models/theme_key.dart';
import 'package:dennisaurus_dev/models/theme_model.dart';
import 'package:flutter/material.dart';

class ThemePickerWidget extends StatelessWidget {
  const ThemePickerWidget({super.key});

  List<ThemeModel> get _allThemes =>
      ThemeKey.values.map((e) => ThemeModel.fromKey(e)).toList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _allThemes.length,
      itemBuilder: (context, index) {
        final theme = _allThemes[index];
        return GestureDetector(
          onTap: () async {
            await ThemeCoordinator.setTheme(theme);
          },
          child: SizedBox(
            height: 200,
            child: theme.previewWidget(context),
          ),
        );
      },
    );
  }
}

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key, required this.theme});
  final ThemeModel theme;

  Widget _previewFromSize(Size size, BuildContext context) {
    if (size.height < 340) {
      return theme.smallPreview(context, padding: EdgeInsets.zero);
    } else if (size.height < 860) {
      return theme.smallPreview(context);
    } else if (size.width < 610) {
      return theme.mediumPreview(context);
    } else {
      return theme.previewWidget(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuery.size;
    return GestureDetector(
      child: _previewFromSize(size, context),
      onTap: () async {
        await ThemeCoordinator.setTheme(theme);
      },
    );
  }
}

extension Preview on ThemeModel {
  Widget mediumPreview(BuildContext context) => Card(
        color: theme.colorScheme.primaryContainer,
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                key.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Row(
              children: [
                _previewBox(
                  theme.colorScheme.background,
                  theme.colorScheme.onBackground,
                  'Background',
                ),
              ],
            ),
          ],
        ),
      );

  Widget smallPreview(
    BuildContext context, {
    EdgeInsets padding = const EdgeInsets.all(16),
  }) =>
      Card(
        color: theme.colorScheme.primaryContainer,
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: padding,
              child: Text(
                key.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ),
      );

  Widget previewWidget(BuildContext context) => Card(
        color: theme.colorScheme.primaryContainer,
        elevation: 8,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                key.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    _previewBox(
                      theme.colorScheme.background,
                      theme.colorScheme.onBackground,
                      'Background',
                    ),
                  ],
                ),
                Row(
                  children: [
                    _previewBox(
                      theme.colorScheme.primary,
                      theme.colorScheme.onPrimary,
                      'Primary',
                    ),
                    _previewBox(
                      theme.colorScheme.secondary,
                      theme.colorScheme.onSecondary,
                      'Secondary',
                    ),
                    _previewBox(
                      theme.colorScheme.tertiary,
                      theme.colorScheme.onTertiary,
                      'Tertiary',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );

  Widget _previewBox(
    Color color,
    Color onColor,
    String text, {
    EdgeInsets padding = const EdgeInsets.all(16),
  }) {
    return Expanded(
      child: ColoredBox(
        color: color,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: onColor),
          ),
        ),
      ),
    );
  }
}
