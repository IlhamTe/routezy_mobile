import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/core/shared/regex_constants.dart';

typedef TextInputValidator = String? Function(String?);

class BaseTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final TextInputValidator? validator;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autoValidateMode;

  final String hintText;
  final String? labelText;
  final String? initialValue;
  final String? accessibilityLabel;

  final bool? enabled;
  final bool? isDense;
  final bool? enableInteractiveSelection;
  final bool obscureText;
  final bool showCursor;
  final bool readOnly;
  final bool? isFilled;
  final bool enableCounterText;

  final int? maxLength;
  final int? maxLines;

  final Widget? prefix;
  final Widget? suffix;

  final Color fillColor;
  final Color? focusColor;

  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;

  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;

  const BaseTextInput({
    super.key,
    this.labelText,
    required this.hintText,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.enabled,
    this.maxLines,
    this.maxLength,
    this.enableCounterText = false,
    this.keyboardType,
    this.focusNode,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.fillColor = Colors.white,
    this.textStyle,
    this.labelStyle,
    this.floatingLabelStyle,
    this.hintStyle,
    this.textAlign = TextAlign.start,
    this.isDense,
    this.accessibilityLabel = '',
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.showCursor = true,
    this.enableInteractiveSelection,
    this.contentPadding,
    this.focusColor,
    this.errorStyle,
    this.readOnly = false,
    this.isFilled,
    this.autoValidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onTapOutside: (_) => focusNode?.unfocus(),
      inputFormatters: [
        /// Default regex for prevent injection attack
        FilteringTextInputFormatter.deny(
          RegExp(RegexConstants.sanitationFormat),
        ),

        ...?inputFormatters,
      ],
      showCursor: showCursor,
      onTap: onTap,
      enableInteractiveSelection: enableInteractiveSelection,
      textCapitalization: textCapitalization,
      initialValue: initialValue,
      focusNode: focusNode,
      enabled: enabled,
      maxLines: obscureText ? 1 : maxLines,
      maxLength: maxLength,
      style: textStyle,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textAlign: textAlign,
      readOnly: readOnly,
      autovalidateMode: autoValidateMode,
      cursorColor: AppColors.primary400,
      buildCounter:
          (context, {required currentLength, required isFocused, maxLength}) {
            return Transform.translate(
              offset: const Offset(0, -30),
              child: Text(
                '$currentLength/$maxLength',
                style: AppTextStyles.bodyBold3.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
            );
          },
      decoration: InputDecoration(
        errorStyle: errorStyle,
        focusColor: focusColor,
        contentPadding: contentPadding,
        labelText: labelText,
        labelStyle: labelStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: floatingLabelStyle,
        hintText: hintText,
        hintStyle: hintStyle,
        isDense: isDense,
        counterText: enableCounterText ? null : '',
        disabledBorder: disabledBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        filled: isFilled,
        fillColor: fillColor,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
