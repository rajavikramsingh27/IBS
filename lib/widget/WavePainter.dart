import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Colors.dart';

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = AppColors.colorYesButton
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        size.width, size.height * 0.62, size.width, size.height * 0.83);
    path.cubicTo(size.width * 0.94, size.height * 0.86, size.width * 0.81,
        size.height * 0.87, size.width * 0.75, size.height * 0.87);
    path.cubicTo(size.width * 0.67, size.height * 0.87, size.width * 0.62,
        size.height * 0.83, size.width * 0.50, size.height * 0.82);
    path.cubicTo(size.width * 0.42, size.height * 0.83, size.width * 0.36,
        size.height * 0.85, size.width * 0.25, size.height * 0.85);
    path.cubicTo(size.width * 0.12, size.height * 0.85, size.width * 0.05,
        size.height * 0.78, 0, size.height * 0.80);
    path.quadraticBezierTo(size.width * -0.0046875, size.height * 0.62, 0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
