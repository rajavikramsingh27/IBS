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
        size.width, size.height * 0.2, size.width, size.height * 0.8);
    path.cubicTo(size.width * 0.96, size.height * 0.88, size.width * 0.92,
        size.height, size.width * 0.84, size.height);
    path.cubicTo(size.width * 0.78, size.height * 1, size.width * 0.66,
        size.height * 0.78, size.width * 0.58, size.height * 0.7);
    path.cubicTo(size.width * 0.42, size.height * 0.5, size.width * 0.34,
        size.height * 0.7, size.width * 0.24, size.height * 0.8);
    path.cubicTo(size.width * 0.16, size.height * 0.98, size.width * 0.07,
        size.height * 0.50, 0, size.height * 0.52);
    path.quadraticBezierTo(size.width * -0.02, size.height * 0.7, 0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
