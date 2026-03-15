import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';

class InkPressableBase extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  final String? accessibilityLabel;
  final double? rippleRadius;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final DecorationImage? imageBackground;
  final double? width;
  final Decoration? decoration;

  const InkPressableBase({
    super.key,
    this.onTap,
    this.accessibilityLabel,
    this.padding,
    this.borderRadius,
    this.rippleRadius,
    required this.child,
    this.color,
    this.boxShadow,
    this.border,
    this.imageBackground,
    this.width,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: decoration ?? BoxDecoration(boxShadow: boxShadow),
      child: Material(
        color: AppColors.transparent,
        clipBehavior: Clip.hardEdge,
        child: Semantics(
          excludeSemantics: true,
          label: 'pressable-$accessibilityLabel',
          child: InkWell(
            onTap: onTap,
            radius: rippleRadius,
            borderRadius: borderRadius,
            child: Ink(
              padding: padding,
              width: width,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: color,
                border: border,
                image: imageBackground,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
