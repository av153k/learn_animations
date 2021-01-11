import 'package:flutter/animation.dart';

class RainDropAnimation {
  final AnimationController animationController;
  RainDropAnimation(
    this.animationController,
  )   : dropRadius = Tween<double>(begin: 0, end: maxDropRadius).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(
              0.0,
              0.2,
              curve: Curves.easeIn,
            ),
          ),
        ),
        dropPosition = Tween<double>(
          begin: 0,
          end: maxRelativeDropY,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(
              0.2,
              0.5,
              curve: Curves.easeIn,
            ),
          ),
        ),
        holeSize = Tween<double>(
          begin: 0,
          end: maxHoleSize,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(0.5, 1.0, curve: Curves.easeIn),
          ),
        ),
        dropVisible = Tween<bool>(
          begin: true,
          end: false,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(
              0.5,
              0.5,
            ),
          ),
        ),
        textOpacity = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(
              0.5,
              0.7,
              curve: Curves.easeIn,
            ),
          ),
        );

  final Animation<double> textOpacity;
  final Animation<double> dropRadius;
  final Animation<double> dropPosition;
  final Animation<bool> dropVisible;
  final Animation<double> holeSize;

  static final double maxDropRadius = 20;
  static final double maxRelativeDropY = 0.5;
  static final double maxHoleSize = 10.0;
}
