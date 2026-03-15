import 'package:geolocator/geolocator.dart';
import 'package:hive_ce/hive.dart';
import 'package:routezy_mobile/core/shared/database_type_id.dart';

import 'lat_long_model.dart';

part 'tracked_location_model.g.dart';

@HiveType(typeId: DatabaseTypeId.trackedLocationDatabase)
class TrackedLocationModel {
  @HiveField(0)
  final String accuracy;

  @HiveField(1)
  final List<LatLong> routes;

  @HiveField(2)
  final DateTime timestamp;

  LocationAccuracy get locationAccuracy {
    return LocationAccuracy.values.firstWhere(
      (e) => e.name == accuracy,
      orElse: () => LocationAccuracy.high,
    );
  }

  TrackedLocationModel({
    required this.accuracy,
    required this.routes,
    required this.timestamp,
  });
}

final dummyRoutes1 = [
  LatLong(-6.2155, 106.8166),
  LatLong(-6.2185, 106.8155),
  LatLong(-6.2210, 106.8140),
  LatLong(-6.2245, 106.8125),
  LatLong(-6.2260, 106.8115),
  LatLong(-6.2285, 106.8100),
  LatLong(-6.2300, 106.8115),
  LatLong(-6.2315, 106.8135),
  LatLong(-6.2325, 106.8150),
  LatLong(-6.2335, 106.8120),
  LatLong(-6.2350, 106.8095),
  LatLong(-6.2365, 106.8075),
  LatLong(-6.2380, 106.8060),
];

final dummyRoutes2 = [
  LatLong(-6.218335, 106.801847),
  LatLong(-6.218520, 106.802500),
  LatLong(-6.218800, 106.803200),
  LatLong(-6.219500, 106.803800),
  LatLong(-6.220500, 106.804200),
  LatLong(-6.221500, 106.804500),
  LatLong(-6.222500, 106.804300),
  LatLong(-6.223500, 106.803800),
  LatLong(-6.224200, 106.803000),
  LatLong(-6.224500, 106.802000),
  LatLong(-6.224300, 106.801000),
  LatLong(-6.223800, 106.800000),
  LatLong(-6.223000, 106.799300),
  LatLong(-6.222000, 106.799000),
  LatLong(-6.221000, 106.799100),
  LatLong(-6.220000, 106.799500),
  LatLong(-6.219200, 106.800200),
  LatLong(-6.218500, 106.801200),
  LatLong(-6.218335, 106.801847),
];

final dummyTrackedLocations = [
  TrackedLocationModel(
    accuracy: LocationAccuracy.high.name,
    routes: dummyRoutes1,
    timestamp: DateTime.now().subtract(Duration(days: 10)),
  ),
  TrackedLocationModel(
    accuracy: LocationAccuracy.high.name,
    routes: dummyRoutes2,
    timestamp: DateTime.now().subtract(Duration(days: 7)),
  ),
];
