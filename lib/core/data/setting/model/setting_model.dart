import 'package:geolocator/geolocator.dart';
import 'package:hive_ce/hive.dart';
import 'package:routezy_mobile/core/shared/database_type_id.dart';

part 'setting_model.g.dart';

@HiveType(typeId: DatabaseTypeId.settingDatabase)
class SettingModel {
  /// Defines the desired accuracy that should be used to determine the
  /// location data.
  @HiveField(0)
  final String accuracy;

  /// The minimum distance (measured in meters) a device must move
  /// horizontally before an update event is generated.
  /// Supply 0 when you want to be notified of all movements.
  @HiveField(1)
  final int distanceFilter;

  /// The [timeLimitInSecond] parameter allows you to specify a timeout interval.
  @HiveField(2)
  final int? timeLimitInSecond;

  LocationAccuracy get locationAccuracy {
    return LocationAccuracy.values.firstWhere(
      (e) => e.name == accuracy,
      orElse: () => LocationAccuracy.high,
    );
  }

  SettingModel({
    required this.accuracy,
    required this.distanceFilter,
    this.timeLimitInSecond,
  });

  Map<String, dynamic> toJson() {
    return {
      'accuracy': accuracy,
      'distanceFilter': distanceFilter,
      'timeLimitInSecond': timeLimitInSecond,
    };
  }

  SettingModel copyWith({String? accuracy, int? distanceFilter}) {
    return SettingModel(
      accuracy: accuracy ?? this.accuracy,
      distanceFilter: distanceFilter ?? this.distanceFilter,
      timeLimitInSecond: timeLimitInSecond,
    );
  }

  SettingModel copyWithForTimeLimit({int? timeLimitInSecond}) {
    return SettingModel(
      accuracy: accuracy,
      distanceFilter: distanceFilter,
      timeLimitInSecond: timeLimitInSecond,
    );
  }
}

final initialSettingModel = SettingModel(
  accuracy: LocationAccuracy.high.name,
  distanceFilter: 10,
);
