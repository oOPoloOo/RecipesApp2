import 'package:flutter/material.dart';

class CurvedClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    //Starts at top left corner 1
    final path = Path();

    //Drawing curved line
    path.lineTo(0, h * 0.3);
    path.quadraticBezierTo(
      w * 0.5,
      h * 0.3 + 70,
      w,
      h * 0.3,
    );
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
