import 'package:carousel_slider/carousel_slider.dart';
import 'package:dennisaurus_dev/models/theme_key.dart';
import 'package:dennisaurus_dev/models/theme_model.dart';
import 'package:flutter/material.dart';

class ThemePickerWidget extends StatelessWidget {
  const ThemePickerWidget(this.onThemeChanged, {super.key});
  final void Function(ThemeModel theme) onThemeChanged;

  List<ThemeModel> get _allThemes =>
      ThemeKey.values.map((e) => ThemeModel.fromKey(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Picker"),
      ),
      body: CarouselSlider.builder(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.8,
          viewportFraction: 0.5,
          enlargeCenterPage: true,
        ),
        itemCount: _allThemes.length,
        itemBuilder: (context, index, pageIndex) {
          final theme = _allThemes[index];
          return GestureDetector(
            onTap: () {
              onThemeChanged(theme);
            },
            child: SizedBox(
              height: 200,
              child: theme.previewWidget(context),
            ),
          );
        },
      ),
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
                  theme.colorScheme.surface,
                  theme.colorScheme.onSurface,
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
                      theme.colorScheme.surface,
                      theme.colorScheme.onSurface,
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
