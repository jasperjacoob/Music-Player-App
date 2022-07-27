import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClipBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.moveTo(0, height);

    path.lineTo(3, height / 4.0);
    path.quadraticBezierTo(10, height / 4.5, (width / 2) - 20, 20);
    path.lineTo((width / 2) - 20, 20);
    path.quadraticBezierTo(width / 2, 10, (width / 2) + 20, 20);
    path.quadraticBezierTo(width - 10, height / 4.5, (width / 2) + 20, 20);
    path.lineTo(width - 3, (height / 4.0));

    path.lineTo(width, height);
    // path.lineTo(width, height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
