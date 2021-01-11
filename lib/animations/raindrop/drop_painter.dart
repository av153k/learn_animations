import 'package:flutter/material.dart';

class RainDropPainter extends CustomPainter {
  bool visible;
  RainDropPainter({
    this.visible,
  });
  @override
  void paint(Canvas canvas, Size size) {
    if (!visible) {
      return;
    }

    Path path = new Path();
    path.moveTo(
      size.width / 2,
      0,
    );
    path.quadraticBezierTo(
      0,
      size.height * 0.8,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width,
      size.height * 0.8,
      size.width / 2,
      0,
    );

    canvas.drawPath(
      path,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(RainDropPainter oldDelegate) => true;
}
