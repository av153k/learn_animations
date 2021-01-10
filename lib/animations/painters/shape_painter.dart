import 'package:flutter/material.dart';
import 'dart:math' as maths;

class ShapePainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;

  ShapePainter(this.sides,
    this.radius,
    this.radians,
  );
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    var angle = (maths.pi * 2) / sides;

    var paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset centerPoint = Offset(
      size.width * 0.5,
      size.height * 0.5,
    );

    Offset startingPoint = Offset(
      radius * maths.cos(radians),
      radius * maths.sin(radians),
    );

    path.moveTo(
      startingPoint.dx + centerPoint.dx,
      startingPoint.dy + centerPoint.dy,
    );

    for (int i = 1; i <= sides; i++) {
      double x = radius * maths.cos(radians + angle * i) + centerPoint.dx;
      double y = radius * maths.sin(radians + angle * i) + centerPoint.dy;
      path.lineTo(x, y);
    }

    path.close();

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(ShapePainter oldDelegate) => true;
}
