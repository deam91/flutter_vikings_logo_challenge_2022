import 'dart:ui';

import 'package:flutter/material.dart';

class Corn extends CustomPainter {
  const Corn({Key? key, this.animation, required this.color});
  final Animation<double>? animation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 3.0)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;

    final double width = size.width;
    final double height = size.height;

    var path = Path();
    path
      ..moveTo(width * .35, 0.0)
      //
      ..quadraticBezierTo(width * .45, height * 0.55, width * .2, height * .8)
      //
      ..quadraticBezierTo(width * .6, height * 0.93, width * .7, height)
      //
      ..quadraticBezierTo(width, height * 0.5, width * .35, 0.0);

    final rotationMatrix = Matrix4.identity()..rotateZ(0.2);
    path = path.transform(rotationMatrix.storage);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
