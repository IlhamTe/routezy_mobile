import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_border_radius.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/core/shared/enum/snackbar_type_enum.dart';
import 'package:routezy_mobile/widget/gap/gap.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

class SnackBarBase extends StatelessWidget {
  final String message;
  final SnackBarType type;

  final VoidCallback onClose;
  final bool showCloseButton;

  const SnackBarBase({
    super.key,
    required this.message,
    required this.type,
    required this.onClose,
    this.showCloseButton = true,
  });

  IconData _icon() {
    if (type == SnackBarType.success) {
      return Icons.check_circle;
    } else if (type == SnackBarType.neutral) {
      return Icons.info;
    }

    return Icons.error;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.paMD,
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: AppBorderRadius.radiusSM,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(_icon(), fill: 1, color: Colors.white, size: 16),

                Gap.width(8),
                Flexible(
                  child: TextLabel(
                    message,
                    style: AppTextStyles.displayMed3,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (showCloseButton)
            GestureDetector(
              onTap: onClose,
              child: Icon(Icons.close, color: Colors.white),
            ),
        ],
      ),
    );
  }
}
