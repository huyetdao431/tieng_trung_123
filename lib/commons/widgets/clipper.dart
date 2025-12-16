import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    var path = Path();
    path.lineTo(0, 64);
    path.quadraticBezierTo(width / 2, 0, width, 64);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
