part of '../setting_page.dart';

class _SelectAccuracyBottomSheet extends StatelessWidget {
  const _SelectAccuracyBottomSheet({
    required this.listAccuracy,
    required this.settingData,
    required this.onSelectedAccuracy,
  });

  final List<LocationAccuracy> listAccuracy;
  final SettingModel settingData;

  final ValueChanged<String> onSelectedAccuracy;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      header: TextLabel('Select accuracy', style: AppTextStyles.heading6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: listAccuracy.map((accuracy) {
          final isSelected = settingData.locationAccuracy == accuracy;
          return InkPressableBase(
            onTap: () {
              Navigator.pop(context);
              onSelectedAccuracy(accuracy.name);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLabel(
                  accuracy.name.toUpperCase(),
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
