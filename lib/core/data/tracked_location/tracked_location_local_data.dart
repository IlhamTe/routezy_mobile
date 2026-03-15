import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/tracked_location_model.dart';

class TrackedLocationLocalData {
  final Box<TrackedLocationModel> _box;

  TrackedLocationLocalData({required Box<TrackedLocationModel> box})
    : _box = box;

  Future<List<TrackedLocationModel>> getAllLocations() async {
    return _box.values.toList();
  }

  Future<void> addAllLocations(List<TrackedLocationModel> locations) async {
    await _box.addAll(locations);
  }

  Future<void> addLocation(TrackedLocationModel location) async {
    await _box.add(location);
  }

  Future<void> updateLocation(int index, TrackedLocationModel user) async {
    return await _box.putAt(index, user);
  }

  Future<void> deleteLocation(int index) async {
    await _box.deleteAt(index);
  }

  Future<void> clearLocations() async {
    await _box.clear();
  }

  ValueListenable<Box<TrackedLocationModel>> listenTrackedLocationChanges() =>
      _box.listenable();
}
