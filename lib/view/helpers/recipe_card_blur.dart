import 'package:flutter/material.dart';
import 'dart:ui';

class RecipeCardBlur extends StatelessWidget {
  final Widget child;
  final double? sigmaX;
  final double? sigmaY;

  RecipeCardBlur({
    required this.child,
    this.sigmaX = 10,
    this.sigmaY = 10,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX!, sigmaY: sigmaY!),
        child: child,
      ),
    );
  }
}
