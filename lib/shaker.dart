import 'package:flutter/material.dart';

class ShakerTransition extends StatefulWidget {
  const ShakerTransition({
    super.key,
    required this.child,
    required this.duration,
    required this.axis,
    required this.offset,
  });
  final Widget child;
  final Duration duration;
  final Axis axis;
  final double offset;

  @override
  State<ShakerTransition> createState() => _ShakerTransitionState();
}

class _ShakerTransitionState extends State<ShakerTransition>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      curve: Curves.elasticOut,
      duration: widget.duration,
      builder: (_, value, child) {
        return Transform.translate(
          offset: widget.axis == Axis.horizontal
              ? Offset(value * widget.offset, 0.0)
              : Offset(0.0, value * widget.offset),
          child: child,
        );
      },
    );
  }
}
