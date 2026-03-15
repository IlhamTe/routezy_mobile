import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_border_radius.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/widget/button/ink_pressable_button.dart';
import 'package:routezy_mobile/widget/gap/gap.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

class PickerButton extends StatelessWidget {
  const PickerButton({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.footNote,
  });

  final String label;
  final String value;
  final String? footNote;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextLabel(
          label,
          style: AppTextStyles.bodyReg3.copyWith(fontWeight: FontWeight.w600),
        ),
        InkPressableBase(
          width: SizeHelper.getScreenWidth,
          padding: AppPadding.phMD + EdgeInsets.symmetric(vertical: 14),
          color: Colors.white,
          borderRadius: AppBorderRadius.all10,
          border: Border.all(color: AppColors.neutral400),
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: TextLabel(
                  value,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.displayReg3,
                ),
              ),

              Gap.width(),

              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: AppColors.textPlaceholder,
              ),
            ],
          ),
        ),

        if (footNote != null) ...[
          Gap.height(4),
          TextLabel(
            footNote!,
            style: AppTextStyles.bodyRegular5,
            color: AppColors.textPlaceholder,
          ),
        ],
      ],
    );
  }
}
