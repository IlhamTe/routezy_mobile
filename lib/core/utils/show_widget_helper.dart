import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_color.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/core/shared/enum/snackbar_type_enum.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/widget/snack_bar/snack_bar_base.dart';

class ShowWidgetHelper {
  ShowWidgetHelper._();

  static Future<T?> showCustomModalBottomSheet<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = false,
    bool useRootNavigator = true,
    Color backgroundColor = Colors.white,
  }) {
    return showModalBottomSheet<T>(
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      backgroundColor: backgroundColor,
      constraints: BoxConstraints(minWidth: SizeHelper.getScreenWidth),
      context: context,
      builder: (bottomSheet) {
        /// Prevent dismiss bottom sheet by [Back Button] at some devices
        return PopScope(canPop: isDismissible, child: builder(bottomSheet));
      },
    );
  }

  static Future<void> showSnackBar({
    required BuildContext context,
    SnackBarType type = SnackBarType.neutral,
    required String message,
    bool showCloseButton = true,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
    EdgeInsetsGeometry? padding,
  }) async {
    await ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: AppColors.transparent,
            padding: padding ?? AppPadding.pvLG,
            duration: Duration(seconds: 2),
            behavior: behavior,
            content: SnackBarBase(
              type: type,
              message: message,
              showCloseButton: showCloseButton,
              onClose: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            ),
          ),
        )
        .closed;

    return;
  }
}
