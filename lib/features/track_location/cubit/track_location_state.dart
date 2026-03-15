part of 'track_location_cubit.dart';

class TrackLocationState extends Equatable {
  final ViewData stateTracking;
  final ViewData stateLocationPermissionService;
  final ViewData stateSaveTracking;

  final bool isTracking;
  final bool shouldPopPage;

  final List<LatLong> route;

  final SettingModel currentSettings;

  const TrackLocationState({
    required this.stateTracking,
    required this.stateLocationPermissionService,
    required this.stateSaveTracking,
    required this.isTracking,
    required this.shouldPopPage,
    required this.route,
    required this.currentSettings,
  });

  factory TrackLocationState.initial() {
    return TrackLocationState(
      stateTracking: ViewData.initial(),
      stateLocationPermissionService: ViewData.initial(),
      stateSaveTracking: ViewData.initial(),
      isTracking: false,
      shouldPopPage: false,
      route: [],
      currentSettings: initialSettingModel,
    );
  }

  @override
  List<Object?> get props => [
    stateTracking,
    stateLocationPermissionService,
    stateSaveTracking,
    isTracking,
    shouldPopPage,
    route,
    currentSettings,
  ];

  TrackLocationState copyWith({
    ViewData? stateTracking,
    ViewData? stateLocationPermissionService,
    ViewData? stateSaveTracking,
    bool? isTracking,
    bool? shouldPopPage,
    List<LatLong>? route,
    SettingModel? currentSettings,
  }) {
    return TrackLocationState(
      stateTracking: stateTracking ?? this.stateTracking,
      stateLocationPermissionService:
          stateLocationPermissionService ?? this.stateLocationPermissionService,
      stateSaveTracking: stateSaveTracking ?? this.stateSaveTracking,
      isTracking: isTracking ?? this.isTracking,
      shouldPopPage: shouldPopPage ?? this.shouldPopPage,
      route: route ?? this.route,
      currentSettings: currentSettings ?? this.currentSettings,
    );
  }
}

extension TrackLocationStateX on TrackLocationState {
  bool get shouldShowTrackResult {
    return isTracking == false &&
        route.isNotEmpty &&
        !stateTracking.status.isError &&
        !stateLocationPermissionService.status.isError;
  }
}
