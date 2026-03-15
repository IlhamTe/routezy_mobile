part of '../setting_page.dart';

class _SettingScreen extends StatefulWidget {
  const _SettingScreen();

  @override
  State<_SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<_SettingScreen>
    with AutomaticKeepAliveClientMixin {
  late final _cubit = context.read<SettingCubit>();

  void _showSuccessSnackBar() {
    if (context.mounted) {
      ShowWidgetHelper.showSnackBar(
        context: context,
        type: SnackBarType.success,
        behavior: SnackBarBehavior.floating,
        showCloseButton: false,
        message: 'Successfully saved track settings',
      );
    }
  }

  void _showErrorSnackBar() {
    if (context.mounted) {
      ShowWidgetHelper.showSnackBar(
        context: context,
        type: SnackBarType.error,
        behavior: SnackBarBehavior.floating,
        showCloseButton: false,
        message: 'Failed to save track settings',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<SettingCubit, SettingState>(
      listenWhen: (prev, current) {
        return prev.stateSaveSettings.status !=
            current.stateSaveSettings.status;
      },
      listener: (context, state) {
        if (state.stateSaveSettings.status.isSuccess) {
          _showSuccessSnackBar();
        } else if (state.stateSaveSettings.status.isError) {
          _showErrorSnackBar();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextLabel(
            'Setting',
            style: AppTextStyles.heading5,
            color: AppColors.primaryMain,
          ),
          centerTitle: false,
          scrolledUnderElevation: 0,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: _cubit.onRefresh,
              color: AppColors.primaryMain,
              backgroundColor: Colors.white,
              child: SingleChildScrollView(
                padding: AppPadding.paLG,
                physics: AlwaysScrollableScrollPhysics(),
                child: ValueListenableBuilder(
                  valueListenable: _cubit.listenSettingChanges(),
                  builder: (context, box, child) {
                    final settingData = box.values.first;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children: [
                        PickerButton(
                          label: 'Accuracy',
                          value: settingData.locationAccuracy.name
                              .toUpperCase(),
                          footNote: 'Better accuracy, higher battery usage.',
                          onTap: () {
                            ShowWidgetHelper.showCustomModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (bottomSheetContext) {
                                return _SelectAccuracyBottomSheet(
                                  listAccuracy: state.listAccuracy,
                                  settingData: settingData,
                                  onSelectedAccuracy: (accuracy) {
                                    _cubit.saveAndUpdateSetting(
                                      settingData.copyWith(accuracy: accuracy),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                        PickerButton(
                          label: 'Distance Filter',
                          value: settingData.distanceFilter.toString(),
                          footNote:
                              'Location changes are only saved if you move more than the configured Distance Filter (in meter).',
                          onTap: () {
                            ShowWidgetHelper.showCustomModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (bottomSheetContext) {
                                return _SelectDistanceFilterBottomSheet(
                                  listDistanceFilter: state.listDistanceFilter,
                                  settingData: settingData,
                                  onSelectedDistance: (distance) {
                                    _cubit.saveAndUpdateSetting(
                                      settingData.copyWith(
                                        distanceFilter: distance,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                        PickerButton(
                          label: 'Time Limit',
                          value: state.listTimeLimit
                              .firstWhere(
                                (timeLimit) =>
                                    timeLimit.value ==
                                    settingData.timeLimitInSecond,
                              )
                              .label,
                          footNote:
                              'Set an idle timeout for location tracking. If the stream stays idle and fails to receive an update within the Time Limit, it raises a Timeout Exception.',
                          onTap: () {
                            ShowWidgetHelper.showCustomModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (bottomSheetContext) {
                                return _SelectTimeLimitBottomSheet(
                                  listTimeLimit: state.listTimeLimit,
                                  settingData: settingData,
                                  onSelectedTimeLimit: (timeLimit) {
                                    _cubit.saveAndUpdateSetting(
                                      settingData.copyWithForTimeLimit(
                                        timeLimitInSecond: timeLimit,
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
