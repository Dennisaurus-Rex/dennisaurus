import 'package:auto_size_text/auto_size_text.dart';
import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/core/images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageCollectionWidget extends StatelessWidget {
  const ImageCollectionWidget(
    this.title,
    this.images,
    this.imageSize,
    this.gradientColors,
  );
  final String title;
  final List<dynamic> images;
  final int imageSize;
  final List<Color> gradientColors;

  factory ImageCollectionWidget.fromModel(ImageCollectionModel model) {
    return ImageCollectionWidget(
      model.title,
      model.images,
      model.imageSize,
      model.gradientColors,
    );
  }

  Widget _resolvedChild(dynamic input) {
    final thisInput = input;
    return switch (thisInput.runtimeType) {
      ImageKey => PngImage(thisInput, height: imageSize.toDouble()),
      IconDataBrands => FaIcon(thisInput, size: imageSize.toDouble()),
      _ => SizedBox.shrink(),
    };
  }

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
            colors: gradientColors,
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
                color: context.theme.colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: AutoSizeText(
                    title,
                    maxLines: 1,
                    style: context.theme.textTheme.displayLarge!.copyWith(
                      color: context.theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceEvenly,
                  spacing: 32,
                  runSpacing: 16,
                  children: images.map(_resolvedChild).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCollectionModel {
  const ImageCollectionModel(
    this.title,
    this.images,
    this.imageSize,
    this.gradientColors,
  );
  final String title;
  final List<dynamic> images;
  final int imageSize;
  final List<Color> gradientColors;
}
