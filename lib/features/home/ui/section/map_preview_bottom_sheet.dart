part of '../home_page.dart';

class _MapPreviewBottomSheet extends StatelessWidget {
  const _MapPreviewBottomSheet({required this.routes});

  final List<LatLng> routes;

  @override
  Widget build(BuildContext context) {
    final distanceInKm = MapUtil.calculateTotalDistance(routes);

    return BottomSheetBase(
      header: TextLabel('Map Preview', style: AppTextStyles.heading5),
      body: ClipRRect(
        borderRadius: AppBorderRadius.all10,
        child: SizedBox(
          width: SizeHelper.getScreenWidth,
          height: 250,
          child: FlutterMap(
            options: MapOptions(
              initialCenter: MapUtil.getCenterFromRoutes(routes),
              initialZoom: distanceInKm > 2 ? 14 : 15,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'id.application.routezy_mobile',
              ),

              PolylineLayer(
                polylines: [
                  Polyline(
                    points: routes,
                    strokeWidth: 3,
                    color: AppColors.primaryMain,
                    pattern: StrokePattern.dotted(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      footer: PrimaryButton.medium(
        onPressed: () => Navigator.pop(context),
        text: 'Close',
      ),
    );
  }
}
