import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:math' as maths;

class CircleWavePainter extends CustomPainter {
  double waveRadius;
  CircleWavePainter(this.waveRadius);
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(
      size.width / 2,
      size.height / 2,
    );

    double maxRadius = maths.sqrt(
      center.dx * center.dx + center.dy * center.dy,
    );

    double waveGap = 8.0;
    double currentRadius = waveRadius;

    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..isAntiAlias = true;

    while (currentRadius < maxRadius) {
      canvas.drawCircle(center, currentRadius, paint);
      currentRadius += waveGap;
    }
  }

  @override
  bool shouldRepaint(CircleWavePainter oldDelegate) => true;
}
