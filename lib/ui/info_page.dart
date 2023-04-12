import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/core/images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    this.displaySmall = false,
  });
  final bool displaySmall;
  static const double _padding = 16;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(_padding),
            child: _LanguageWidget(displaySmall),
          ),
          Padding(
            padding: const EdgeInsets.all(_padding),
            child: _PlatformWidget(displaySmall),
          ),
          Padding(
            padding: const EdgeInsets.all(_padding),
            child: _IDEWidget(displaySmall),
          ),
        ],
      ),
    );
  }
}

class _ResolvedColumnOrRow extends StatelessWidget {
  const _ResolvedColumnOrRow(this.asColumns, this.children);
  final bool asColumns;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    if (asColumns) {
      return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: children
            .map((e) => Center(
                  child: e,
                ))
            .toList(),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    }
  }
}

class _LanguageWidget extends StatelessWidget {
  const _LanguageWidget(this.asColumns);
  final bool asColumns;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: context.theme.colorScheme.secondaryContainer,
      elevation: 24,
      clipBehavior: Clip.hardEdge,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.theme.colorScheme.primaryContainer,
              context.theme.colorScheme.secondaryContainer,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: context.theme.colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Languages I prefer:',
                    style: context.theme.textTheme.displayLarge!.copyWith(
                      color: context.theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ),
              _ResolvedColumnOrRow(
                asColumns,
                const [
                  PngImage(
                    ImageKey.dart,
                    width: 100,
                    padding: EdgeInsets.all(16),
                    // boxfit: BoxFit.fitHeight,
                  ),
                  PngImage(
                    ImageKey.swift,
                    width: 100,
                    padding: EdgeInsets.all(16),
                    // boxfit: BoxFit.fitHeight,
                  ),
                  PngImage(
                    ImageKey.kotlin,
                    width: 100,
                    padding: EdgeInsets.all(16),
                    // boxfit: BoxFit.fitHeight,
                  ),
                  PngImage(
                    ImageKey.typescript,
                    width: 100,
                    padding: EdgeInsets.all(16),
                    // boxfit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlatformWidget extends StatelessWidget {
  const _PlatformWidget(this.asColumns);
  final bool asColumns;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: context.theme.colorScheme.primaryContainer,
      elevation: 24,
      clipBehavior: Clip.hardEdge,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              context.theme.colorScheme.secondaryContainer,
              context.theme.colorScheme.tertiaryContainer,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: context.theme.colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Platforms I know:',
                    style: context.theme.textTheme.displayLarge!.copyWith(
                      color: context.theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              _ResolvedColumnOrRow(
                asColumns,
                const [
                  FaIcon(
                    FontAwesomeIcons.android,
                    size: 100,
                  ),
                  FaIcon(
                    FontAwesomeIcons.apple,
                    size: 100,
                  ),
                  PngImage(ImageKey.flutter, width: 100),
                  PngImage(ImageKey.gcp, width: 100),
                  PngImage(ImageKey.firebase, width: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IDEWidget extends StatelessWidget {
  const _IDEWidget(this.asColumns);
  final bool asColumns;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: context.theme.colorScheme.tertiaryContainer,
      clipBehavior: Clip.hardEdge,
      elevation: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.theme.colorScheme.tertiaryContainer,
              context.theme.colorScheme.primaryContainer,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: context.theme.colorScheme.tertiary,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "IDE's I use:",
                    style: context.theme.textTheme.displayLarge!.copyWith(
                      color: context.theme.colorScheme.onTertiary,
                    ),
                  ),
                ),
              ),
              _ResolvedColumnOrRow(
                asColumns,
                const [
                  PngImage(ImageKey.vsCode, width: 100),
                  PngImage(ImageKey.xcode, width: 100),
                  PngImage(ImageKey.androidStudio, width: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
