import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:routezy_mobile/core/data/setting/model/setting_model.dart';

class SettingLocalData {
  final Box<SettingModel> _box;

  final _settingKey = 'setting-database';

  SettingLocalData({required Box<SettingModel> box}) : _box = box;

  SettingModel? getSettingData() {
    return _box.get(_settingKey);
  }

  Future<void> saveAndUpdateSetting(SettingModel item) async {
    return await _box.put(_settingKey, item);
  }

  Future<void> deleteSettingData() async {
    return await _box.delete(_settingKey);
  }

  ValueListenable<Box<SettingModel>> listenSettingChanges() =>
      _box.listenable();
}
