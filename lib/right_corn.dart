import 'package:flutter/material.dart';
import 'package:flutter_vikings_logo/widgets/corn_base_dark.dart';

import 'contants.dart';
import 'widgets/corn.dart';

class RightCorn extends StatelessWidget {
  const RightCorn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Transform.translate(
            offset: const Offset(size * .49, -size * .28),
            child: const CustomPaint(
              size: Size(size / 3, size / 2),
              painter: Corn(color: Color(0xff3dc6f9)),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: const Offset(size * 0.34, 30),
            child: const CustomPaint(
              size: Size(size / 3.5, size / 4),
              painter: CornBaseDark(color: Color(0xff045899)),
            ),
          ),
        ),
      ],
    );
  }
}
