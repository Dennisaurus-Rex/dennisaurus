import 'package:auto_size_text/auto_size_text.dart';
import 'package:dennisaurus_dev/core/constants.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    Key? key,
    this.style,
    required this.gradient,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final int? maxLines;

  Shader _shaderCallback(Rect bounds) => gradient.createShader(bounds);

  Widget _resolvedChild() => switch (kIsMobileWeb) {
        true => AutoSizeText(
            text,
            style: style,
            maxLines: maxLines,
          ),
        false => ShaderMask(
            shaderCallback: _shaderCallback,
            child: AutoSizeText(
              text,
              style: style,
              maxLines: maxLines,
            ),
          ),
      };

  @override
  Widget build(BuildContext context) {
    return _resolvedChild();
  }
}
