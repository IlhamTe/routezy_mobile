part of 'setting_cubit.dart';

class SettingState extends Equatable {
  final ViewData stateSaveSettings;

  final List<LocationAccuracy> listAccuracy;
  final List<DistanceFilterModel> listDistanceFilter;
  final List<TimeLimitModel> listTimeLimit;

  const SettingState({
    required this.stateSaveSettings,
    required this.listAccuracy,
    required this.listDistanceFilter,
    required this.listTimeLimit,
  });

  factory SettingState.initial() {
    return SettingState(
      stateSaveSettings: ViewData.initial(),
      listAccuracy: [
        LocationAccuracy.low,
        LocationAccuracy.medium,
        LocationAccuracy.high,
        LocationAccuracy.best,
      ],
      listDistanceFilter: [
        DistanceFilterModel(label: '5 meter', value: 5),
        DistanceFilterModel(label: '10 meter', value: 10),
        DistanceFilterModel(label: '25 meter', value: 25),
        DistanceFilterModel(label: '50 meter', value: 50),
        DistanceFilterModel(label: '100 meter', value: 100),
      ],
      listTimeLimit: [
        TimeLimitModel(label: 'No Time Limit', value: null),
        TimeLimitModel(label: '10 seconds', value: 10),
        TimeLimitModel(label: '30 seconds', value: 30),
        TimeLimitModel(label: '1 minute', value: 60),
      ],
    );
  }

  @override
  List<Object?> get props => [
    stateSaveSettings,
    listAccuracy,
    listDistanceFilter,
    listTimeLimit,
  ];

  SettingState copyWith({
    ViewData? stateSaveSettings,
    List<LocationAccuracy>? listAccuracy,
    List<DistanceFilterModel>? listDistanceFilter,
    List<TimeLimitModel>? listTimeLimit,
  }) {
    return SettingState(
      stateSaveSettings: stateSaveSettings ?? this.stateSaveSettings,
      listAccuracy: listAccuracy ?? this.listAccuracy,
      listDistanceFilter: listDistanceFilter ?? this.listDistanceFilter,
      listTimeLimit: listTimeLimit ?? this.listTimeLimit,
    );
  }
}
