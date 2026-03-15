import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:routezy_mobile/core/data/setting/model/setting_model.dart';
import 'package:routezy_mobile/core/data/setting/setting_local_data.dart';

abstract class SettingRepository {
  SettingModel? getSettingData();

  Future<void> saveAndUpdateSetting(SettingModel item);

  ValueListenable<Box<SettingModel>> listenSettingChanges();
}

class SettingRepositoryImpl implements SettingRepository {
  final SettingLocalData _settingLocalData;

  SettingRepositoryImpl({required SettingLocalData settingLocalData})
    : _settingLocalData = settingLocalData;

  @override
  SettingModel? getSettingData() {
    return _settingLocalData.getSettingData() ?? initialSettingModel;
  }

  @override
  ValueListenable<Box<SettingModel>> listenSettingChanges() =>
      _settingLocalData.listenSettingChanges();

  @override
  Future<void> saveAndUpdateSetting(SettingModel item) async {
    return await _settingLocalData.saveAndUpdateSetting(item);
  }
}
