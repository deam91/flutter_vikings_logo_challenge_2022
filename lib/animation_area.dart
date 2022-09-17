import 'package:flutter/material.dart';
import 'package:flutter_vikings_logo/left_corn.dart';
import 'package:flutter_vikings_logo/right_corn.dart';

import 'contants.dart';
import 'widgets/bezier_tween.dart';
import 'widgets/dark_blue_section.dart';
import 'widgets/light_blue_section.dart';

class AnimationArea extends StatelessWidget {
  final AnimationController controller;
  final Size deviceSize;

  AnimationArea({super.key, required this.controller, required this.deviceSize})
      : darkSection = BezierTween(
                begin: Offset(-deviceSize.width, deviceSize.height),
                end: const Offset(0, 0),
                control: Offset(-deviceSize.height / 3, deviceSize.height / 3))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.2,
              curve: Curves.easeInOutCubic,
            ),
          ),
        ),
        lightSection = BezierTween(
                begin: Offset(deviceSize.width * 2, 0),
                end: const Offset(0, 0),
                control: Offset(deviceSize.width, deviceSize.height / 2))
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.25,
              0.4,
              curve: Curves.easeOutCirc,
            ),
          ),
        ),
        leftCorn = Tween<Offset>(
          begin: Offset(-deviceSize.width, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.45,
              0.55,
              curve: Curves.easeOutCirc,
            ),
          ),
        ),
        rightCorn = Tween<Offset>(
          begin: Offset(deviceSize.width, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.45,
              0.55,
              curve: Curves.easeOutCirc,
            ),
          ),
        ),
        flutter = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.7,
              1.0,
              curve: Curves.linearToEaseOut,
            ),
          ),
        ),
        vikings = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.85,
              1.0,
              curve: Curves.linearToEaseOut,
            ),
          ),
        ),
        opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
          ),
        ),
        opacityLetters = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.85,
              1.0,
              curve: Curves.easeOutCirc,
            ),
          ),
        ),
        shakePieces = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.4,
              0.45,
              curve: Curves.elasticOut,
            ),
          ),
        );

  final Animation<Offset> darkSection;
  final Animation<Offset> lightSection;
  final Animation<Offset> leftCorn;
  final Animation<Offset> rightCorn;
  final Animation<double> flutter;
  final Animation<double> vikings;
  final Animation<double> opacity;
  final Animation<double> opacityLetters;
  final Animation<double> shakePieces;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return Material(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: FadeTransition(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: darkSection.value,
                        child: const CustomPaint(
                          size: Size(size, size),
                          painter: DarkBlueSection(color: Color(0xff045899)),
                        ),
                      ),
                    ),
                  ),
                  //
                  Center(
                    child: Transform.translate(
                      offset: lightSection.value,
                      child: const CustomPaint(
                        size: Size(size, size),
                        painter: LightBlueSection(color: Color(0xff3dc6f9)),
                      ),
                    ),
                  ),
                  //
                  Transform.translate(
                    offset: leftCorn.value,
                    child: FadeTransition(
                        opacity: opacity, child: const LeftCorn()),
                  ),
                  //
                  Transform.translate(
                    offset: rightCorn.value,
                    child: FadeTransition(
                        opacity: opacity, child: const RightCorn()),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Transform.translate(
                offset: Offset(0, deviceSize.height * flutter.value),
                child: FadeTransition(
                  opacity: opacityLetters,
                  child: const Text(
                    'Flutter',
                    style: TextStyle(fontSize: size * 0.2),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, deviceSize.height * vikings.value),
                child: FadeTransition(
                  opacity: opacityLetters,
                  child: const Text(
                    'Vikings',
                    style: TextStyle(fontSize: size * 0.2),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
