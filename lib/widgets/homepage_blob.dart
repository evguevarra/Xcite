import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class HomeCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(size.width * 0.05555556, size.height * 0.9746852);
    path_0.cubicTo(
        size.width * 0.1111111,
        size.height * 0.9552500,
        size.width * 0.2222222,
        size.height * 0.8842870,
        size.width * 0.3333333,
        size.height * 0.7385231);
    path_0.cubicTo(
        size.width * 0.4444444,
        size.height * 0.6024815,
        size.width * 0.5772947,
        size.height * 0.4602079,
        size.width * 0.6884058,
        size.height * 0.4213380);
    path_0.cubicTo(
        size.width * 0.7995169,
        size.height * 0.3824685,
        size.width * 0.8888889,
        size.height * 0.4372843,
        size.width * 0.9444444,
        size.height * 0.5247407);
    path_0.lineTo(size.width, size.height * 0.6024815);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.9444444, 0);
    path_0.cubicTo(size.width * 0.8888889, 0, size.width * 0.7777778, 0,
        size.width * 0.6666667, 0);
    path_0.cubicTo(size.width * 0.5555556, 0, size.width * 0.4444444, 0,
        size.width * 0.3333333, 0);
    path_0.cubicTo(size.width * 0.2222222, 0, size.width * 0.1111111, 0,
        size.width * 0.05555556, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Color(0xff26C4D8).withOpacity(0.37);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.8194444);
    path_1.lineTo(size.width * 0.05555556, size.height * 0.8028889);
    path_1.cubicTo(
        size.width * 0.1111111,
        size.height * 0.7863333,
        size.width * 0.2222222,
        size.height * 0.7532269,
        size.width * 0.3333333,
        size.height * 0.6290694);
    path_1.cubicTo(
        size.width * 0.4444444,
        size.height * 0.5131852,
        size.width * 0.5809179,
        size.height * 0.3670236,
        size.width * 0.6920290,
        size.height * 0.3339144);
    path_1.cubicTo(
        size.width * 0.8031401,
        size.height * 0.3008056,
        size.width * 0.8888889,
        size.height * 0.3724745,
        size.width * 0.9444444,
        size.height * 0.4469694);
    path_1.lineTo(size.width, size.height * 0.5131852);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(size.width * 0.9444444, 0);
    path_1.cubicTo(size.width * 0.8888889, 0, size.width * 0.7777778, 0,
        size.width * 0.6666667, 0);
    path_1.cubicTo(size.width * 0.5555556, 0, size.width * 0.4444444, 0,
        size.width * 0.3333333, 0);
    path_1.cubicTo(size.width * 0.2222222, 0, size.width * 0.1111111, 0,
        size.width * 0.05555556, 0);
    path_1.lineTo(0, 0);
    path_1.lineTo(0, size.height * 0.8194444);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = Color(0xff26C4D8).withOpacity(0.37);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
