import 'package:dennisaurus_dev/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon(
    this.icon, {
    Key? key,
    this.size = 44 + 8,
    required this.gradient,
    this.backgroundColor,
  }) : super(key: key);

  final IconData icon;
  final double size;
  final Gradient gradient;
  final Color? backgroundColor;

  Shader _shaderCallback(Rect bounds) => gradient.createShader(bounds);

  Widget _resolvedChild() {
    if (kIsMobileWeb) {
      return FaIcon(
        icon,
        color: gradient.colors.first,
        size: size - 8,
      );
    } else {
      return ShaderMask(
        shaderCallback: _shaderCallback,
        child: FaIcon(
          icon,
          size: size - 8,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(size),
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: backgroundColor ?? Colors.transparent,
        child: _resolvedChild(),
      ),
    );
  }
}
