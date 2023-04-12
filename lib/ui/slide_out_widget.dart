import 'package:dennisaurus_dev/core/extensions/build_context_convenience.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SlideOutWidget extends StatefulWidget {
  final Widget child;
  final double stickoutMargin;
  final Size fullSize;
  final SlideDirection direction;
  final Duration duration;
  final Curve curve;

  const SlideOutWidget({
    super.key,
    required this.child,
    required this.stickoutMargin,
    required this.fullSize,
    this.direction = SlideDirection.left,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  @override
  State<SlideOutWidget> createState() => _SlideOutWidgetState();
}

class _SlideOutWidgetState extends State<SlideOutWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;

  void _animateIn(PointerEnterEvent event) {
    _isHovering = true;
    setState(() {});
  }

  void _animateOut(PointerExitEvent event) {
    _isHovering = false;
    setState(() {});
  }

  SlidePosition _stickOutOffset(Size size) {
    switch (widget.direction) {
      case SlideDirection.left:
        return SlidePosition(left: size.width - widget.stickoutMargin);
      case SlideDirection.right:
        return SlidePosition(
            right: -(widget.fullSize.width - widget.stickoutMargin));
      case SlideDirection.up:
        return SlidePosition(
            top: -(widget.fullSize.height - widget.stickoutMargin));
      case SlideDirection.down:
        return SlidePosition(bottom: size.height - widget.stickoutMargin);
    }
  }

  SlidePosition _fullOffset(Size size) {
    switch (widget.direction) {
      case SlideDirection.left:
        return SlidePosition(
          left: size.width - widget.fullSize.width,
        );
      case SlideDirection.right:
        return const SlidePosition(right: 0);
      case SlideDirection.up:
        return const SlidePosition(top: 0);
      case SlideDirection.down:
        return SlidePosition(
          bottom: size.height - widget.fullSize.height,
        );
    }
  }

  SlidePosition _offset(Size size) =>
      _isHovering ? _fullOffset(size) : _stickOutOffset(size);

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuery.size;
    return SizedBox.fromSize(
      size: widget.fullSize,
      child: Stack(
        children: [
          AnimatedPositioned(
            left: _offset(size).left,
            right: _offset(size).right,
            top: _offset(size).top,
            bottom: _offset(size).bottom,
            duration: widget.duration,
            child: SizedBox.fromSize(
              size: widget.fullSize,
              child: MouseRegion(
                onEnter: _animateIn,
                onExit: _animateOut,
                child: widget.child,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}

enum SlideDirection { left, right, up, down }

class SlidePosition {
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  const SlidePosition({
    this.left,
    this.right,
    this.top,
    this.bottom,
  });
}
