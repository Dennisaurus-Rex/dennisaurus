import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({
    Key? key,
    required this.gradient,
    required this.child,
    this.elevation = 0,
    this.shape,
  }) : super(key: key);

  final Gradient gradient;
  final Widget child;
  final double elevation;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      shape: shape,
      color: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: child,
      ),
    );
  }
}
