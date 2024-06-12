import 'package:carousel_slider/carousel_slider.dart';
import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:dennisaurus_dev/core/images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dennisaurus_dev/ui/image_widget.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    this.displaySmall = false,
  });
  final bool displaySmall;
  static const double _padding = 16;

  List<Widget> _children(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(_padding),
        child: ImageCollectionWidget(
          "Languages I prefer:",
          [
            ImageKey.dart,
            ImageKey.swift,
            ImageKey.kotlin,
            ImageKey.typescript,
          ],
          100,
          [
            context.theme.colorScheme.primaryContainer,
            context.theme.colorScheme.secondaryContainer,
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(_padding),
        child: ImageCollectionWidget(
          'Platforms I know:',
          [
            FontAwesomeIcons.android,
            FontAwesomeIcons.apple,
            ImageKey.flutter,
            ImageKey.gcp,
            ImageKey.firebase,
          ],
          100,
          [
            context.theme.colorScheme.secondaryContainer,
            context.theme.colorScheme.tertiaryContainer,
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(_padding),
        child: ImageCollectionWidget(
          'IDEs I use:',
          [
            ImageKey.vsCode,
            ImageKey.xcode,
            ImageKey.androidStudio,
          ],
          100,
          [
            context.theme.colorScheme.tertiaryContainer,
            context.theme.colorScheme.primaryContainer,
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        // height: MediaQuery.of(context).size.height,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        initialPage: 0,
        scrollDirection: Axis.vertical,
      ),
      itemCount: _children(context).length,
      itemBuilder: (context, index, pageIndex) => _children(context)[index],
    );
  }
}
