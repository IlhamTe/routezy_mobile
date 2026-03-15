import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';

enum SnackBarType {
  neutral,
  success,
  error;

  Color get backgroundColor {
    return switch (this) {
      SnackBarType.neutral => AppColors.neutral950,
      SnackBarType.success => AppColors.successMain,
      SnackBarType.error => AppColors.primaryMain,
    };
  }
}
