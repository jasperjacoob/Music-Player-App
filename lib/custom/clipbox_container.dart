import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    // path.moveTo(0, height);
    // path.lineTo(3, height / 4.0);
    // path.quadraticBezierTo(10, height / 4.5, (width / 2) - 20, 20);
    // path.lineTo((width / 2) - 20, 20);
    // path.quadraticBezierTo(width / 2, 10, (width / 2) + 20, 20);
    // path.quadraticBezierTo(width - 10, height / 4.5, (width / 2) + 20, 20);
    // path.lineTo(width - 3, (height / 4.0));
    // path.lineTo(width, height);

    // path.lineTo(width, height / 2);
    path.moveTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * -0.0004167, size.height * 0.9435714,
        size.width * 0.0416667, size.height * 0.9285714);
    path.cubicTo(
        size.width * 0.1562500,
        size.height * 0.8807143,
        size.width * 0.4837500,
        size.height * 0.7292857,
        size.width * 0.5000000,
        size.height * 0.7371429);
    path.cubicTo(
        size.width * 0.5162500,
        size.height * 0.7292857,
        size.width * 0.8437500,
        size.height * 0.8807143,
        size.width * 0.9583333,
        size.height * 0.9285714);
    path.quadraticBezierTo(size.width * 1.0012500, size.height * 0.9432143,
        size.width, size.height * 0.9985714);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
