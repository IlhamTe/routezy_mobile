import 'package:hive_ce/hive.dart';
import 'package:latlong2/latlong.dart';
import 'package:routezy_mobile/core/shared/database_type_id.dart';

part 'lat_long_model.g.dart';

@HiveType(typeId: DatabaseTypeId.latLongDatabase)
class LatLong {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  LatLong(this.latitude, this.longitude);
}

extension ListLatLongExtension on List<LatLong> {
  List<LatLng> toLatLng2() {
    return map((data) => LatLng(data.latitude, data.longitude)).toList();
  }
}
