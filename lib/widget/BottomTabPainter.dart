import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';

class BottomTabPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = AppColors.colorBackground
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.0090, size.height * 0.26,
        size.width * 0.035, size.height * 0.25);
    path.cubicTo(size.width * 0.075, size.height * 0.25, size.width * 0.35,
        size.height * 0.25, size.width * 0.42, size.height * 0.25);
    path.cubicTo(size.width * 0.45, size.height * 0.030, size.width * 0.55,
        size.height * 0.025, size.width * 0.58, size.height * 0.25);
    path.cubicTo(size.width * 0.65, size.height * 0.25, size.width * 0.90,
        size.height * 0.25, size.width * 0.95, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.99, size.height * 0.25, size.width, size.height * 0.35);
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
