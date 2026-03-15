part of '../track_location_page.dart';

class _TrackingResultBottomSheet extends StatelessWidget {
  const _TrackingResultBottomSheet({
    required this.route,
    required this.accuracy,
    required this.onSavePressed,
  });

  final List<LatLng> route;
  final LocationAccuracy accuracy;

  final VoidCallback onSavePressed;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      header: TextLabel(
        'Your Result',
        style: AppTextStyles.heading6,
        color: AppColors.primaryMain,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          _RoutePreviewSection(route: route),
          _TrackDataSection(route: route, accuracy: accuracy),
          Gap.height(32),
        ],
      ),
      footer: _FooterSection(onSavePressed: onSavePressed),
    );
  }
}

class _RoutePreviewSection extends StatelessWidget {
  const _RoutePreviewSection({required this.route});

  final List<LatLng> route;

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
      child: Stack(
        children: [
          Center(
            child: PolylinePreview(
              coordinates: route,
              customSize: Size(70, 70),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: TextLabel(
              'Route preview',
              style: AppTextStyles.bodyRegular5.copyWith(
                fontStyle: FontStyle.italic,
              ),
              color: AppColors.primaryMain,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackDataSection extends StatelessWidget {
  const _TrackDataSection({required this.route, required this.accuracy});

  final List<LatLng> route;
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
                        '${MapUtil.calculateTotalDistance(route)}',
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

class _FooterSection extends StatelessWidget {
  const _FooterSection({required this.onSavePressed});

  final VoidCallback onSavePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        PrimaryButton.medium(onPressed: onSavePressed, text: 'SAVE'),
        SecondaryButton.medium(
          onPressed: () => Navigator.pop(context),
          text: 'CANCEL',
        ),
      ],
    );
  }
}
