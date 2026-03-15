import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/design_system/app_border_radius.dart';
import 'package:routezy_mobile/app/design_system/app_padding.dart';
import 'package:routezy_mobile/core/utils/size_helper.dart';
import 'package:routezy_mobile/widget/gap/gap.dart';

class BottomSheetBase extends StatelessWidget {
  final Widget? header;
  final Widget body;
  final Widget? footer;

  final EdgeInsets? padding;
  final bool useSafeArea;

  const BottomSheetBase({
    super.key,
    this.header,
    required this.body,
    this.footer,
    this.padding,
    this.useSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null) ...[header!, Gap.height(16)],

        Flexible(child: body),

        if (footer != null) ...[Gap.height(16), footer!],
      ],
    );

    return Container(
      width: SizeHelper.getScreenWidth,
      padding: padding ?? AppPadding.paLG,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.t16,
      ),
      child: useSafeArea ? SafeArea(top: false, child: content) : content,
    );
  }
}
