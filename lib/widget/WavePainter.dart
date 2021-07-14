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
    path.quadraticBezierTo(size.width, size.height * 0.6265179, size.width,
        size.height * 0.8353571);
    path.cubicTo(
        size.width * 0.9489125,
        size.height * 0.8640143,
        size.width * 0.8193750,
        size.height * 0.8733000,
        size.width * 0.7518750,
        size.height * 0.8714286);
    path.cubicTo(
        size.width * 0.6691375,
        size.height * 0.8710714,
        size.width * 0.6193000,
        size.height * 0.8282143,
        size.width * 0.5006250,
        size.height * 0.8246429);
    path.cubicTo(
        size.width * 0.4227375,
        size.height * 0.8292000,
        size.width * 0.3595375,
        size.height * 0.8552714,
        size.width * 0.2500000,
        size.height * 0.8571429);
    path.cubicTo(
        size.width * 0.1253875,
        size.height * 0.8542000,
        size.width * 0.0543000,
        size.height * 0.7840143,
        0,
        size.height * 0.8078571);
    path.quadraticBezierTo(
        size.width * -0.0046875, size.height * 0.6121429, 0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
