import 'package:flutter/material.dart';

class HolePainter extends CustomPainter {
  Color holeColor;
  double holeSize;

  HolePainter({
    @required this.holeColor,
    @required this.holeSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = holeSize / 2;
    Rect rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
    Rect outerCircleRect = Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius: radius,
    );
    Rect innerCircleRect = Rect.fromCircle(
      center: Offset(
        size.width / 2,
        size.height / 2,
      ),
      radius: radius / 2,
    );

    Path transparentHole = Path.combine(
      PathOperation.difference,
      Path()..addRect(rect),
      Path()
        ..addOval(outerCircleRect)
        ..close(),
    );

    Path halfTransParentRing = Path.combine(
      PathOperation.difference,
      Path()
        ..addOval(outerCircleRect)
        ..close(),
      Path()
        ..addOval(innerCircleRect)
        ..close(),
    );

    canvas.drawPath(
      transparentHole,
      Paint()..color = holeColor,
    );
    canvas.drawPath(
      halfTransParentRing,
      Paint()..color = holeColor.withOpacity(0.5),
    );
  }

  @override
  bool shouldRepaint(HolePainter oldDelegate) => true;
}
