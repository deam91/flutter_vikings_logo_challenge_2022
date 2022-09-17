import 'dart:ui';

import 'package:flutter/material.dart';

class DarkBlueSection extends CustomPainter {
  const DarkBlueSection({Key? key, this.animation, required this.color});
  final Animation<double>? animation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 5.0)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;

    final double width = size.width;
    final double height = size.height;

    final path = Path();
    path
      ..moveTo(0.0, height / 2 + height * 0.1)
      ..lineTo(0.0, height * 0.9)
      //
      ..quadraticBezierTo(0, height + height * .1, width * 0.17, height * 0.95)
      //
      ..lineTo(width * 0.75, height / 2 * 0.6) // <-
      //
      ..lineTo(width * 0.6, height * 0.1) // <-
      //
      ..quadraticBezierTo(width * 0.5, 0, width * 0.4, height * 0.1) // <-
      //
      ..lineTo(width * 0.05, height / 2) // <-
      //
      ..quadraticBezierTo(
          0.0, height / 2 + height * 0.04, 0.0, height / 2 + height * 0.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
