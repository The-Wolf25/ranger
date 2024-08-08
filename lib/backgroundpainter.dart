import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Draw the background
    paint.color = const Color.fromARGB(255, 136, 97, 202);
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.8, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);

    paint.color = Color.fromARGB(255, 190, 170, 246);
    path = Path();
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.6, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);

    paint.color = Color.fromARGB(255, 235, 124, 255);
    path = Path();
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
