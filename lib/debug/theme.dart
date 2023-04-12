import 'package:dennisaurus_dev/core/extensions/color_convenience.dart';
import 'package:dennisaurus_dev/core/extensions/string_capitalized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

extension AllColors on ColorScheme {
  List<_ColorPair> get _colorPairs => [
        _ColorPair(
          primary,
          onPrimary,
          'primary',
        ),
        _ColorPair(
          primaryContainer,
          onPrimaryContainer,
          'primaryContainer',
        ),
        _ColorPair(
          secondary,
          onSecondary,
          'secondary',
        ),
        _ColorPair(
          secondaryContainer,
          onSecondaryContainer,
          'secondaryContainer',
        ),
        _ColorPair(
          tertiary,
          onTertiary,
          'tertiary',
        ),
        _ColorPair(
          tertiaryContainer,
          onTertiaryContainer,
          'tertiaryContainer',
        ),
        _ColorPair(
          surface,
          onSurface,
          'surface',
        ),
        _ColorPair(
          surfaceVariant,
          onSurfaceVariant,
          'surfaceVariant',
        ),
        _ColorPair(
          inverseSurface,
          onInverseSurface,
          'inverseSurface',
        ),
        _ColorPair(
          background,
          onBackground,
          'background',
        ),
        _ColorPair(
          error,
          onError,
          'error',
        ),
        _ColorPair(
          errorContainer,
          onErrorContainer,
          'errorContainer',
        ),
        _ColorPair(
          inversePrimary,
          onPrimary,
          'inversePrimary',
        ),
        _ColorPair(
          outline,
          null,
          'outline',
        ),
        _ColorPair(
          outlineVariant,
          null,
          'outlineVariant',
        ),
        _ColorPair(
          shadow,
          null,
          'shadow',
        ),
        _ColorPair(
          scrim,
          null,
          'scrim',
        ),
        _ColorPair(
          surfaceTint,
          null,
          'surfaceTint',
        ),
      ];

  SliverList get colorPallete => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: _colorPairs[index].colorTile,
          ),
          childCount: _colorPairs.length,
        ),
      );
}

class _ColorPair {
  const _ColorPair(this.color, this.onColor, this.colorName);

  final Color color;
  final String colorName;
  final Color? onColor;
  String get onColorName =>
      onColor == null ? colorName : 'on${colorName.toCapitalized}';

  Widget get colorTile => Card(
        elevation: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          tileColor: color,
          textColor: onColor ?? color.contrastAsBlackOrWhite,
          title: Text(onColorName),
        ),
      );
}
