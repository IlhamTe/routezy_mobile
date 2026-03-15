import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/widget/button/base_button.dart';

/// Outline-Button
class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;

  final String text;
  final String accessibilityLabel;

  final ButtonSize buttonSize;
  final ButtonContent buttonContent;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Color? disableBackgroundColor;
  final Color? shadowColor;

  final bool enabled;
  final bool isLoading;

  final double? width;
  final double? height;
  final double? elevation;

  final TextStyle? textStyle;
  final BorderRadius? borderRadius;

  final Widget? prefix;
  final Widget? suffix;

  final EdgeInsetsGeometry? padding;

  const SecondaryButton.small({
    super.key,
    required this.onPressed,
    required this.text,
    this.accessibilityLabel = '',
    this.buttonContent = ButtonContent.center,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.disableBackgroundColor,
    this.enabled = true,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.elevation,
    this.padding,
    this.shadowColor,
  }) : buttonSize = ButtonSize.small;

  const SecondaryButton.medium({
    super.key,
    required this.onPressed,
    required this.text,
    this.accessibilityLabel = '',
    this.buttonContent = ButtonContent.center,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.disableBackgroundColor,
    this.enabled = true,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.elevation,
    this.padding,
    this.shadowColor,
  }) : buttonSize = ButtonSize.medium;

  const SecondaryButton.large({
    super.key,
    required this.onPressed,
    required this.text,
    this.accessibilityLabel = '',
    this.buttonContent = ButtonContent.center,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.disableBackgroundColor,
    this.enabled = true,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.elevation,
    this.padding,
    this.shadowColor,
  }) : buttonSize = ButtonSize.large;

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      padding: padding,
      buttonContent: buttonContent,
      buttonSize: buttonSize,
      width: width ?? SizeHelper.getScreenWidth,
      height: height,
      onPressed: onPressed,
      text: text,
      enabled: enabled,
      backgroundColor: backgroundColor ?? AppColors.neutral0,
      foregroundColor: foregroundColor ?? AppColors.primaryMain,
      borderColor: enabled
          ? borderColor ?? AppColors.primaryMain
          : AppColors.neutral400,
      disableBackgroundColor: disableBackgroundColor,
      accessibilityLabel: accessibilityLabel,
      isLoading: isLoading,
      textStyle: textStyle,
      borderRadius: borderRadius,
      elevation: elevation,
      prefix: Padding(padding: AppPadding.pr8, child: prefix),
      suffix: Padding(padding: AppPadding.pl8, child: suffix),
      shadowColor: shadowColor,
    );
  }
}
