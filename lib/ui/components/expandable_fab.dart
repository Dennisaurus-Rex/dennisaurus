import 'dart:math';
import 'dart:ui';

import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen = false,
    this.distance = 112,
    this.onOpenChanged,
    this.title,
    required this.children,
  });

  final bool initialOpen;
  final double distance;
  final List<Widget> children;
  final void Function(bool isOpen)? onOpenChanged;
  final String? title;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

final class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  bool _open = false;
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      widget.onOpenChanged?.call(_open);
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (ctx, w) => Transform.translate(
            offset: Offset(
              lerpDouble(400, 200, _expandAnimation.value) ?? 400,
              lerpDouble(400, 200, _expandAnimation.value) ?? 400,
            ),
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.theme.colorScheme.primaryContainer,
                  width: 4,
                ),
                // borderRadius: BorderRadius.circular(200),
                gradient: LinearGradient(
                  colors: [
                    context.theme.colorScheme.primary,
                    context.theme.colorScheme.tertiaryContainer,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                      color: context.theme.colorScheme.shadow.withOpacity(0.5),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(-1, -1)),
                ],
              ),
            ),
          ),
        ),
        // ClipOval(
        //   child: BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        //       child: SizedBox.square(dimension: 200)),
        // ),
        _buildTapToCloseFab(),
        ..._buildExpandingActionButtons(),
        _buildTapToOpenFab(),
      ],
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
            opacity: _open ? 0.0 : 1.0,
            curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
            duration: const Duration(milliseconds: 250),
            child: switch (widget.title) {
              null => FloatingActionButton(
                  onPressed: _toggle,
                  child: const FaIcon(
                    FontAwesomeIcons.userAstronaut,
                  ),
                ),
              _ => FloatingActionButton.extended(
                  onPressed: _toggle,
                  label: Text(
                    widget.title!,
                    style: context.theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const FaIcon(
                    FontAwesomeIcons.userAstronaut,
                  ),
                ),
            }),
      ),
    );
  }
}

final class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
