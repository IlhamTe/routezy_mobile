part of '../home_page.dart';

class _TrackLocationItem extends StatelessWidget {
  const _TrackLocationItem({
    required this.title,
    required this.accuracy,
    required this.routes,
    required this.timestamp,
  });

  final String title;

  final LocationAccuracy accuracy;

  final List<LatLng> routes;

  final DateTime timestamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeHelper.getScreenWidth,
      margin: AppPadding.phLG,
      padding: AppPadding.ptLG,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.all10,
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral950.withValues(alpha: 0.1),
            spreadRadius: 4,
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          _HeaderSection(title: title, timestamp: timestamp),

          _RoutePreviewSection(routes: routes),

          _TrackDataSection(routes: routes, accuracy: accuracy),

          _ViewMapButtonSection(
            onTap: () {
              ShowWidgetHelper.showCustomModalBottomSheet(
                context: context,
                isScrollControlled: true,
                enableDrag: true,
                builder: (bottomSheetContext) {
                  return _MapPreviewBottomSheet(routes: routes);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.title, required this.timestamp});

  final String title;
  final DateTime timestamp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.plLG,
          child: TextLabel(
            'HISTORY',
            style: AppTextStyles.bodyRegular5,
            color: AppColors.neutral600,
          ),
        ),
        Padding(
          padding: AppPadding.phLG,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextLabel(
                title,
                style: AppTextStyles.heading6,
                color: AppColors.primaryMain,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextLabel(
                    DateFormatUtil.formatFullDate(timestamp),
                    style: AppTextStyles.bodyRegular5,
                  ),
                  TextLabel(
                    DateFormatUtil.getTimeOnly(timestamp),
                    style: AppTextStyles.bodyRegular5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoutePreviewSection extends StatelessWidget {
  const _RoutePreviewSection({required this.routes});

  final List<LatLng> routes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeHelper.getScreenWidth,
      padding: AppPadding.phMD + AppPadding.pvSM,
      margin: AppPadding.phLG,
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: AppBorderRadius.all8,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          PolylinePreview(coordinates: routes, customSize: Size(70, 70)),

          TextLabel(
            '*For more accurate results, tap View Map.',
            style: AppTextStyles.bodyRegular5.copyWith(
              fontStyle: FontStyle.italic,
            ),
            color: AppColors.primaryMain,
          ),
        ],
      ),
    );
  }
}

class _TrackDataSection extends StatelessWidget {
  const _TrackDataSection({required this.routes, required this.accuracy});

  final List<LatLng> routes;
  final LocationAccuracy accuracy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.phLG,
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: Container(
              padding: AppPadding.phMD + AppPadding.pvSM,
              decoration: BoxDecoration(
                color: AppColors.primary50,
                borderRadius: AppBorderRadius.all8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  TextLabel(
                    'Distance',
                    style: AppTextStyles.bodyReg4,
                    color: AppColors.primaryMain,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextLabel(
                        '${MapUtil.calculateTotalDistance(routes)}',
                        style: AppTextStyles.heading6,
                        color: AppColors.primaryMain,
                      ),
                      TextLabel(
                        'km',
                        style: AppTextStyles.bodyRegular4,
                        color: AppColors.primaryMain,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: AppPadding.phMD + AppPadding.pvSM,
              decoration: BoxDecoration(
                color: AppColors.primary50,
                borderRadius: AppBorderRadius.all8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  TextLabel(
                    'Accuracy',
                    style: AppTextStyles.bodyReg4,
                    color: AppColors.primaryMain,
                  ),
                  TextLabel(
                    accuracy.name.toUpperCase(),
                    style: AppTextStyles.heading6,
                    color: AppColors.primaryMain,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewMapButtonSection extends StatelessWidget {
  const _ViewMapButtonSection({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkPressableBase(
      onTap: onTap,
      width: SizeHelper.getScreenWidth,
      padding: AppPadding.pvMD,
      decoration: BoxDecoration(
        color: AppColors.primaryMain,
        borderRadius: AppBorderRadius.b10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextLabel(
            'View Map',
            style: AppTextStyles.bodyBold3,
            color: Colors.white,
          ),
          Gap.width(4),
          Icon(Icons.map, color: Colors.white),
        ],
      ),
    );
  }
}
