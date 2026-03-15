import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_text_style.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/widget/bottom_sheet/bottom_sheet_base.dart';
import 'package:routezy_mobile/widget/button/primary_button.dart';
import 'package:routezy_mobile/widget/gap/gap.dart';
import 'package:routezy_mobile/widget/text_label/text_label.dart';

class LocationPermissionAlertBottomSheet extends StatelessWidget {
  const LocationPermissionAlertBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_off, color: AppColors.primaryMain, size: 60),
          Gap.height(16),
          TextLabel('Location Access Required', style: AppTextStyles.heading6),
          Gap.height(16),
          TextLabel(
            'Routezy requires location permission to work optimally. Please enable location services to continue.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      footer: PrimaryButton.medium(
        text: 'Understand',
        width: SizeHelper.getScreenWidth,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
