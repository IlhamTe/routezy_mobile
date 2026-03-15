import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routezy_mobile/core/data/setting/model/setting_model.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/lat_long_model.dart';
import 'package:routezy_mobile/core/data/tracked_location/model/tracked_location_model.dart';
import 'package:routezy_mobile/core/shared/view_data_state.dart';
import 'package:routezy_mobile/features/track_location/repository/track_location_repository.dart';

part 'track_location_state.dart';

class TrackLocationCubit extends Cubit<TrackLocationState> {
  TrackLocationCubit({required TrackLocationRepository repository})
    : _repository = repository,
      super(TrackLocationState.initial());

  final TrackLocationRepository _repository;

  final _service = FlutterBackgroundService();

  StreamSubscription? _locationUpdateSub;
  StreamSubscription? _timeoutExceptionSub;
  StreamSubscription? _permissionExceptionSub;

  void initialize() async {
    final currentSettings = _repository.getSettingData();
    emit(state.copyWith(currentSettings: currentSettings));

    _locationUpdateSub = _service.on('locationUpdate').listen((data) {
      if (data == null) return;

      final lat = data['lat'] as double;
      final lng = data['lng'] as double;
      final position = LatLong(lat, lng);

      /// Save route
      final route = List<LatLong>.from(state.route);
      route.add(position);
      emit(state.copyWith(route: route));
    });

    _timeoutExceptionSub = _service.on('timeoutException').listen((data) {
      emit(state.copyWith(stateTracking: ViewData.error(), isTracking: false));
    });

    _permissionExceptionSub = _service.on('permissionException').listen((data) {
      emit(
        state.copyWith(
          stateLocationPermissionService: ViewData.error(),
          isTracking: false,
        ),
      );
    });
  }

  void startTracking() async {
    emit(
      state.copyWith(
        stateTracking: ViewData.initial(),
        stateLocationPermissionService: ViewData.initial(),
        shouldPopPage: false,
      ),
    );

    final currentSettings = state.currentSettings;
    bool isRunning = await _service.isRunning();

    if (!isRunning) {
      await _service.startService();
      emit(state.copyWith(isTracking: true));

      await Future.delayed(const Duration(milliseconds: 500));
    }

    _service.invoke('startTracking', currentSettings.toJson());
  }

  void stopTracking({required bool shouldPopPage}) {
    _service.invoke('stopTracking');

    if (!isClosed) {
      emit(state.copyWith(isTracking: false, shouldPopPage: shouldPopPage));
    }
  }

  void saveTrackingLocation() async {
    emit(state.copyWith(stateSaveTracking: ViewData.loading()));

    final data = TrackedLocationModel(
      accuracy: state.currentSettings.accuracy,
      routes: state.route,
      timestamp: DateTime.now(),
    );

    try {
      await _repository.addLocation(data);
      emit(state.copyWith(stateSaveTracking: ViewData.success()));
      _resetSavedRoute();
    } catch (e) {
      emit(state.copyWith(stateSaveTracking: ViewData.error()));
    }
  }

  void _resetSavedRoute() {
    emit(state.copyWith(route: []));
  }

  @override
  Future<void> close() {
    stopTracking(shouldPopPage: true);
    _locationUpdateSub?.cancel();
    _timeoutExceptionSub?.cancel();
    _permissionExceptionSub?.cancel();
    return super.close();
  }
}
