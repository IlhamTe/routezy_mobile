import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routezy_mobile/core/data/setting/model/setting_model.dart';
import 'package:routezy_mobile/core/data/setting/setting_local_data.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/tracked_location_model.dart';
import 'package:routezy_mobile/core/data/tracked_location/tracked_location_local_data.dart';
import 'package:routezy_mobile/core/shared/view_data_state.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required TrackedLocationLocalData trackedLocationLocalData,
    required SettingLocalData settingLocalData,
  }) : _trackedLocationLocalData = trackedLocationLocalData,
       _settingLocalData = settingLocalData,
       super(AppState.initial());

  final TrackedLocationLocalData _trackedLocationLocalData;
  final SettingLocalData _settingLocalData;

  void initializeHistoryAndSettingData() async {
    emit(state.copyWith(stateAppInitial: ViewData.loading()));

    final savedTrackedLocations = await _trackedLocationLocalData
        .getAllLocations();
    final savedSettingData = _settingLocalData.getSettingData();

    /// Insert dummy location when [savedTrackedLocations] is empty
    if (savedTrackedLocations.isEmpty) {
      await _trackedLocationLocalData.addAllLocations(dummyTrackedLocations);
    }

    /// Insert initial setting data when [savedSettingData] is null
    if (savedSettingData == null) {
      await _settingLocalData.saveAndUpdateSetting(initialSettingModel);
    }

    emit(state.copyWith(stateAppInitial: ViewData.success()));
  }
}
