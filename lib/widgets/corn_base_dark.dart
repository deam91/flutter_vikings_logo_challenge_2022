import 'dart:ui';

import 'package:flutter/material.dart';

class CornBaseDark extends CustomPainter {
  const CornBaseDark({Key? key, this.animation, required this.color});
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
      ..moveTo(width * 0.7, 0.0)
      //
      ..lineTo(width * 0.15, height * .48)
      //
      ..quadraticBezierTo(0.0, height * 0.65, width * 0.15, height)
      //
      ..quadraticBezierTo(width / 2, height / 2, width, height * 0.15);

    final rotationMatrix = Matrix4.identity()
      ..rotateY(3.14)
      ..rotateZ(-0.05)
      ..translate(-width);
    path = path.transform(rotationMatrix.storage);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
