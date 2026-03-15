import 'package:hive_ce_flutter/adapters.dart';
import 'package:routezy_mobile/core/data/setting/model/setting_model.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/tracked_location_model.dart';
import 'package:routezy_mobile/hive_registrar.g.dart';

class HiveStorageService {
  static HiveStorageService? _instance;

  late final Box<TrackedLocationModel> _trackedLocationBox;
  late final Box<SettingModel> _settingBox;

  HiveStorageService._internal();

  final _trackedLocationBoxName = 'tracked-location-box';
  final _settingBoxName = 'setting-box';

  factory HiveStorageService() {
    _instance ??= HiveStorageService._internal();

    return _instance!;
  }

  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapters();

    /// Open All Boxes
    await _openAllBoxes();
  }

  Future<void> _openAllBoxes() async {
    _trackedLocationBox = await Hive.openBox<TrackedLocationModel>(
      _trackedLocationBoxName,
    );

    _settingBox = await Hive.openBox<SettingModel>(_settingBoxName);
  }

  /// Getter Box
  Box<TrackedLocationModel> get trackedLocationBox => _trackedLocationBox;
  Box<SettingModel> get settingBox => _settingBox;

  /// Generic box getter if needed
  Box<T> getBox<T>(String boxName) => Hive.box<T>(boxName);
}
