import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';

class CircularLoading extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double size;

  const CircularLoading({
    super.key,
    this.size = 24,
    this.color = AppColors.primary50,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(strokeWidth: strokeWidth, color: color),
    );
  }
}
