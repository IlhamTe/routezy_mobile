import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routezy_mobile/app/design_system/app_border_radius.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/widget/text_input/base_text_input.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

class PrimaryTextInput extends StatefulWidget {
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
  final CrossAxisAlignment crossAxisAlignment;
  final AutovalidateMode? autoValidateMode;

  final String labelText;
  final String hintText;
  final String? initialValue;
  final String? accessibilityLabel;
  final String? footnote;

  final bool? isDense;
  final bool? enableInteractiveSelection;
  final bool? isFilled;
  final bool isPassword;
  final bool isError;
  final bool enableCounterText;
  final bool showCursor;
  final bool readOnly;
  final bool enabled;

  final int? maxLength;
  final int? maxLines;

  final Widget? prefix;
  final Widget? suffix;
  final Widget? footNoteIcon;

  final Color? fillColor;
  final Color? focusColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? labelColor;

  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;

  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;

  final BorderRadius? borderRadius;

  const PrimaryTextInput({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.enabled = true,
    this.maxLength,
    this.keyboardType,
    this.focusNode,
    this.isPassword = false,
    this.isError = false,
    this.prefix,
    this.suffix,
    this.enableCounterText = false,
    this.fillColor,
    this.labelColor,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.textAlign = TextAlign.start,
    this.isDense,
    this.accessibilityLabel = '',
    this.textCapitalization = TextCapitalization.none,
    this.onTap,
    this.showCursor = true,
    this.enableInteractiveSelection,
    this.footnote,
    this.footNoteIcon,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.readOnly = false,
    this.contentPadding,
    this.isFilled = true,
    this.focusColor,
    this.errorStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.borderRadius,
    this.autoValidateMode,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.maxLines = 1,
  });

  @override
  State<PrimaryTextInput> createState() => _PrimaryTextInputState();
}

class _PrimaryTextInputState extends State<PrimaryTextInput> {
  late final _focusNode = widget.focusNode ?? FocusNode();

  bool _isVisibility = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        BaseTextInput(
          textStyle:
              widget.textStyle ??
              AppTextStyles.displayReg3.copyWith(
                color: widget.enabled ? Colors.black : AppColors.neutral400,
              ),
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          focusNode: _focusNode,
          labelText: widget.labelText,
          hintText: widget.hintText,
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          initialValue: widget.initialValue,
          enabled: widget.enabled,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword && !_isVisibility,
          prefix: widget.prefix,
          suffix: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  iconSize: 20,
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _isVisibility = !_isVisibility;
                    });
                  },
                )
              : widget.suffix,
          contentPadding:
              widget.contentPadding ?? AppPadding.pvSM + AppPadding.phMD,
          focusColor: AppColors.primaryMain,
          isFilled: widget.isFilled,
          fillColor: widget.enabled
              ? (widget.fillColor ?? Colors.white)
              : AppColors.neutral50,
          errorStyle:
              widget.errorStyle ??
              AppTextStyles.bodyRegular4.copyWith(color: AppColors.primary800),
          labelStyle:
              widget.labelStyle ??
              AppTextStyles.bodyReg3.copyWith(
                color: widget.labelColor ?? AppColors.neutral950,
                fontWeight: FontWeight.w600,
              ),
          floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
            final defaultTextStyle = AppTextStyles.bodyReg3.copyWith(
              color: widget.labelColor ?? AppColors.neutral950,
              fontWeight: FontWeight.w600,
            );
            if (states.contains(WidgetState.focused)) {
              return defaultTextStyle.copyWith(
                color: widget.isError
                    ? AppColors.primary800
                    : widget.focusedBorderColor ?? AppColors.primary400,
              );
            }

            return defaultTextStyle;
          }),
          hintStyle:
              widget.hintStyle ??
              AppTextStyles.displayReg3.copyWith(
                color: widget.enabled
                    ? AppColors.textPlaceholder
                    : AppColors.neutral400,
                fontWeight: FontWeight.w400,
              ),
          textAlign: widget.textAlign,
          isDense: widget.isDense,
          accessibilityLabel: widget.accessibilityLabel,
          autoValidateMode: widget.autoValidateMode,
          enableCounterText: widget.enableCounterText,
          enabledBorder:
              widget.enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isError
                      ? AppColors.primary800
                      : widget.enabledBorderColor ?? AppColors.neutral400,
                  width: 1,
                ),
                borderRadius: widget.borderRadius ?? AppBorderRadius.all10,
              ),
          focusedBorder:
              widget.focusedBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isError
                      ? AppColors.primary800
                      : widget.focusedBorderColor ?? AppColors.primary400,
                  width: 1,
                ),
                borderRadius: widget.borderRadius ?? AppBorderRadius.all10,
              ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.neutral600, width: 1),
            borderRadius: widget.borderRadius ?? AppBorderRadius.all10,
          ),
          focusedErrorBorder:
              widget.focusedErrorBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primary800,
                  width: 1,
                ),
                borderRadius: widget.borderRadius ?? AppBorderRadius.all10,
              ),
          errorBorder:
              widget.errorBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primary800,
                  width: 1,
                ),
                borderRadius: widget.borderRadius ?? AppBorderRadius.all10,
              ),
          textCapitalization: widget.textCapitalization,
          onTap: widget.onTap,
          showCursor: widget.showCursor,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          validator: (_) {
            return widget.validator?.call(widget.controller?.text);
          },
        ),
        if (widget.footnote?.isNotEmpty == true)
          Padding(
            padding: AppPadding.pt4,
            child: Row(
              spacing: 2,
              children: [
                if (widget.footNoteIcon != null) widget.footNoteIcon!,
                Expanded(
                  child: TextLabel(
                    widget.footnote ?? '',
                    style: AppTextStyles.bodyRegular5,
                    color: AppColors.textPlaceholder,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
