part of '../setting_page.dart';

class _SelectDistanceFilterBottomSheet extends StatelessWidget {
  const _SelectDistanceFilterBottomSheet({
    required this.listDistanceFilter,
    required this.settingData,
    required this.onSelectedDistance,
  });

  final List<DistanceFilterModel> listDistanceFilter;
  final SettingModel settingData;

  final ValueChanged<int> onSelectedDistance;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      header: TextLabel(
        'Select distance filter',
        style: AppTextStyles.heading6,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: listDistanceFilter.map((distance) {
          final isSelected = settingData.distanceFilter == distance.value;
          return InkPressableBase(
            onTap: () {
              Navigator.pop(context);
              onSelectedDistance(distance.value);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLabel(
                  distance.label.toUpperCase(),
                  style: AppTextStyles.bodyReg3,
                ),

                if (isSelected)
                  Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primaryMain,
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
