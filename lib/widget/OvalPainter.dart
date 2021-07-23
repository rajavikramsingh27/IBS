import 'package:flutter/material.dart';

class OvalPainter extends CustomPainter {
  final Color color;

  OvalPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.cubicTo(size.width * 0.0015, size.height * 0.39, size.width * 0.26,
        size.height * 1, size.width * 0.50, size.height);
    path.cubicTo(size.width * 0.74, size.height, size.width, size.height * 0.39,
        size.width, 0);
    path.cubicTo(size.width * 0.75, 0, size.width * 0.75, 0, 0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
