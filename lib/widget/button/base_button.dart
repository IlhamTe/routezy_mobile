import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_border_radius.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/widget/loading/circular_loading.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

enum ButtonSize { small, medium, large }

enum ButtonContent { start, center }

extension ButtonSizeExtension on ButtonSize {
  double get height {
    switch (this) {
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 42;
      case ButtonSize.large:
        return 48;
    }
  }

  TextStyle get textStyle {
    switch (this) {
      case ButtonSize.small:
        return AppTextStyles.bodyBold3;
      case ButtonSize.medium:
        return AppTextStyles.bodyBold2;
      case ButtonSize.large:
        return AppTextStyles.bodyBold1;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case ButtonSize.small:
        return AppPadding.ph12;
      case ButtonSize.medium:
        return AppPadding.pa10;
      case ButtonSize.large:
        return AppPadding.ph16;
    }
  }
}

class ButtonBase extends StatelessWidget {
  final String accessibilityLabel;
  final String text;
  final VoidCallback onPressed;

  final Widget? prefix;
  final Widget? suffix;

  final ButtonStyle? style;
  final TextStyle? textStyle;

  final double? width;
  final double? height;
  final double? elevation;

  final ButtonSize buttonSize;
  final ButtonContent buttonContent;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Color? disableBackgroundColor;
  final Color? shadowColor;

  final bool enabled;
  final bool isDisable;
  final bool isLoading;

  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const ButtonBase({
    super.key,
    required this.onPressed,
    required this.text,
    this.prefix,
    this.suffix,
    this.style,
    this.focusNode,
    this.isDisable = false,
    this.accessibilityLabel = '',
    this.textStyle,
    this.enabled = true,
    this.width,
    this.height,
    this.buttonSize = ButtonSize.medium,
    this.buttonContent = ButtonContent.center,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.disableBackgroundColor,
    this.shadowColor,
    this.elevation,
    this.isLoading = false,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? buttonSize.height,
      child: Semantics(
        excludeSemantics: true,
        label: 'button-$accessibilityLabel',
        child: ElevatedButton(
          onPressed: (enabled && !isLoading)
              ? () {
                  onPressed.call();
                }
              : null,
          focusNode: focusNode,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: padding ?? buttonSize.padding,
            elevation: elevation,
            disabledBackgroundColor:
                disableBackgroundColor ??
                (isLoading ? backgroundColor : AppColors.neutral400),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? AppBorderRadius.all8,
              side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
            shadowColor: shadowColor,
          ),
          child: isLoading
              ? CircularLoading(size: buttonSize.height / 2)
              : buttonContent == ButtonContent.center
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ?prefix,
                    Flexible(
                      child: TextLabel(
                        text,
                        style: textStyle ?? buttonSize.textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ?suffix,
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ?prefix,
                    TextLabel(text, style: textStyle ?? buttonSize.textStyle),
                    ?suffix,
                  ],
                ),
        ),
      ),
    );
  }
}
