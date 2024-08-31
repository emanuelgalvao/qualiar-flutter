import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double blur;
  final double opacity;
  final Color color;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final Widget child;

  const GlassContainer({
    super.key,
    this.blur = 10,
    this.opacity = 0.2,
    this.color = Colors.white,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 10,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              color: color.withOpacity(opacity),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
              border: Border.all(
                width: 1.5,
                color: color.withOpacity(0.05),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
