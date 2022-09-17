import 'package:flutter/material.dart';
import 'package:flutter_vikings_logo/widgets/corn_dark.dart';

import 'contants.dart';
import 'widgets/corn_base.dart';

class LeftCorn extends StatelessWidget {
  const LeftCorn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Transform.translate(
            offset: const Offset(-size * 0.34, 30),
            child: const CustomPaint(
              size: Size(size / 3.5, size / 4),
              painter: CornBase(color: Color(0xff3dc6f9)),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: const Offset(-size * .5, -size * .21),
            child: const CustomPaint(
              size: Size(size / 3, size / 2),
              painter: CornDark(color: Color(0xff045899)),
            ),
          ),
        ),
      ],
    );
  }
}
