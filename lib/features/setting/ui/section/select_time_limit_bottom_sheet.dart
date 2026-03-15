part of '../setting_page.dart';

class _SelectTimeLimitBottomSheet extends StatelessWidget {
  const _SelectTimeLimitBottomSheet({
    required this.listTimeLimit,
    required this.settingData,
    required this.onSelectedTimeLimit,
  });

  final List<TimeLimitModel> listTimeLimit;
  final SettingModel settingData;

  final ValueChanged<int?> onSelectedTimeLimit;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      header: TextLabel('Select time limit', style: AppTextStyles.heading6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: listTimeLimit.map((timeLimit) {
          final isSelected = settingData.timeLimitInSecond == timeLimit.value;
          return InkPressableBase(
            onTap: () {
              Navigator.pop(context);
              onSelectedTimeLimit(timeLimit.value);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextLabel(
                  timeLimit.label.toUpperCase(),
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
