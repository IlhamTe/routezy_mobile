import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/widget/button/base_button.dart';

/// Filled-Button
class PrimaryButton extends StatelessWidget {
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

  final double? width;
  final double? height;

  final bool enabled;
  final bool isLoading;

  final TextStyle? textStyle;

  final BorderRadius? borderRadius;

  final Widget? prefix;
  final Widget? suffix;

  final EdgeInsetsGeometry? padding;

  const PrimaryButton.small({
    super.key,
    required this.onPressed,
    required this.text,
    this.accessibilityLabel = '',
    this.buttonContent = ButtonContent.center,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.disableBackgroundColor,
    this.shadowColor,
    this.enabled = true,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.padding,
  }) : buttonSize = ButtonSize.small;

  const PrimaryButton.medium({
    super.key,
    required this.onPressed,
    required this.text,
    this.accessibilityLabel = '',
    this.buttonContent = ButtonContent.center,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.disableBackgroundColor,
    this.shadowColor,
    this.enabled = true,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.padding,
  }) : buttonSize = ButtonSize.medium;

  const PrimaryButton.large({
    super.key,
    required this.onPressed,
    required this.text,
    this.accessibilityLabel = '',
    this.buttonContent = ButtonContent.center,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.disableBackgroundColor,
    this.shadowColor,
    this.enabled = true,
    this.width,
    this.height,
    this.isLoading = false,
    this.textStyle,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.padding,
  }) : buttonSize = ButtonSize.large;

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      accessibilityLabel: accessibilityLabel,
      text: text,
      width: width ?? SizeHelper.getScreenWidth,
      height: height,
      onPressed: onPressed,
      padding: padding,
      buttonContent: buttonContent,
      buttonSize: buttonSize,
      enabled: enabled,
      backgroundColor: backgroundColor ?? AppColors.primaryMain,
      foregroundColor: foregroundColor ?? AppColors.neutral0,
      borderColor: borderColor ?? backgroundColor,
      disableBackgroundColor: disableBackgroundColor,
      isLoading: isLoading,
      textStyle: textStyle,
      borderRadius: borderRadius,
      prefix: Padding(padding: AppPadding.pr8, child: prefix),
      suffix: Padding(padding: AppPadding.pl8, child: suffix),
      shadowColor: shadowColor,
    );
  }
}
