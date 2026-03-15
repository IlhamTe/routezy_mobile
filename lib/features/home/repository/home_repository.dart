import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/tracked_location_model.dart';
import 'package:routezy_mobile/core/data/tracked_location/tracked_location_local_data.dart';

abstract class HomeRepository {
  ValueListenable<Box<TrackedLocationModel>> listenTrackedLocationChanges();
}

class HomeRepositoryImpl implements HomeRepository {
  final TrackedLocationLocalData _trackedLocationLocalData;

  HomeRepositoryImpl({
    required TrackedLocationLocalData trackedLocationLocalData,
  }) : _trackedLocationLocalData = trackedLocationLocalData;

  @override
  ValueListenable<Box<TrackedLocationModel>> listenTrackedLocationChanges() {
    return _trackedLocationLocalData.listenTrackedLocationChanges();
  }
}
