import 'package:routezy_mobile/core/data/setting/setting_local_data.dart';
import 'package:routezy_mobile/core/data/tracked_location/tracked_location_local_data.dart';
import 'package:routezy_mobile/core/services/local_storage/hive/hive_storage_service.dart';
import 'package:routezy_mobile/features/home/repository/home_repository.dart';
import 'package:routezy_mobile/features/main_home/repository/main_home_repository.dart';
import 'package:routezy_mobile/features/setting/repository/setting_repository.dart';
import 'package:routezy_mobile/features/track_location/repository/track_location_repository.dart';

import 'get_it.dart';

class DependencyInjections {
  DependencyInjections._();

  static Future<void> initialize() async {
    /// Set Up Hive Storage Injection
    await _setUpHiveStorageInjection();

    /// ---------------- Repositories -------------- \\\
    getIt.registerLazySingleton<MainHomeRepository>(
      () => MainHomeRepositoryImpl(),
    );
    getIt.registerLazySingleton<TrackLocationRepository>(
      () => TrackLocationRepositoryImpl(
        settingLocalData: getIt<SettingLocalData>(),
        trackedLocationLocalData: getIt<TrackedLocationLocalData>(),
      ),
    );
    getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        trackedLocationLocalData: getIt<TrackedLocationLocalData>(),
      ),
    );
    getIt.registerLazySingleton<SettingRepository>(
      () => SettingRepositoryImpl(settingLocalData: getIt<SettingLocalData>()),
    );

    /// ---------------- End of Repositories -------------- \\\

    /// Wait for all async singletons to be ready
    await getIt.allReady();
  }
}

Future<void> _setUpHiveStorageInjection() async {
  final hiveStorageService = HiveStorageService();

  await hiveStorageService.init();

  getIt.registerLazySingleton<TrackedLocationLocalData>(
    () => TrackedLocationLocalData(box: hiveStorageService.trackedLocationBox),
  );
  getIt.registerLazySingleton<SettingLocalData>(
    () => SettingLocalData(box: hiveStorageService.settingBox),
  );
}
