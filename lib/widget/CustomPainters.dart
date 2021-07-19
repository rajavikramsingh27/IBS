import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'dart:math' as math;

class BottomCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.colorBackground
      ..style = PaintingStyle.fill;
    // ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.5000000);
    path.quadraticBezierTo(size.width * 0.5003125, size.height * 0.4987500,
        size.width * 0.6875000, size.height * 0.5000000);
    path.cubicTo(
        size.width * 0.7140625,
        size.height * 0.30,
        size.width * 0.8478125,
        size.height * 0.30,
        size.width * 0.8762500,
        size.height * 0.4950000);
    path.quadraticBezierTo(size.width * 0.9071875, size.height * 0.4950000,
        size.width, size.height * 0.4950000);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  final Color color;

  MyPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
