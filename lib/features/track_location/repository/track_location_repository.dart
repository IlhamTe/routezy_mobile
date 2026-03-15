import 'package:routezy_mobile/core/data/setting/model/setting_model.dart';
import 'package:routezy_mobile/core/data/setting/setting_local_data.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/tracked_location_model.dart';
import 'package:routezy_mobile/core/data/tracked_location/tracked_location_local_data.dart';

abstract class TrackLocationRepository {
  SettingModel getSettingData();

  Future<void> addLocation(TrackedLocationModel location);
}

class TrackLocationRepositoryImpl implements TrackLocationRepository {
  final SettingLocalData _settingLocalData;
  final TrackedLocationLocalData _trackedLocationLocalData;

  TrackLocationRepositoryImpl({
    required SettingLocalData settingLocalData,
    required TrackedLocationLocalData trackedLocationLocalData,
  }) : _settingLocalData = settingLocalData,
       _trackedLocationLocalData = trackedLocationLocalData;

  @override
  Future<void> addLocation(TrackedLocationModel location) async {
    return await _trackedLocationLocalData.addLocation(location);
  }

  @override
  SettingModel getSettingData() {
    return _settingLocalData.getSettingData() ?? initialSettingModel;
  }
}
