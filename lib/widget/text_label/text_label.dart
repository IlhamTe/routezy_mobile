import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';

class TextLabel extends StatelessWidget {
  final String label;
  final String accessibilityLabel;

  final TextStyle? style;
  final TextStyle? fontFamily;

  final Color? color;

  final TextAlign? textAlign;
  final TextOverflow? overflow;

  final int? maxLines;
  final bool? softWrap;

  const TextLabel(
    this.label, {
    super.key,
    this.accessibilityLabel = '',
    this.style,
    this.maxLines,
    this.textAlign,
    this.color,
    this.overflow,
    this.softWrap,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      excludeSemantics: true,
      label: 'text-$accessibilityLabel',
      child: Text(
        label,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        overflow: overflow,
        style: AppTextStyles.defaultLabel
            .copyWith(color: color)
            .merge(style)
            .merge(fontFamily ?? AppTextStyles.poppins),
      ),
    );
  }
}
