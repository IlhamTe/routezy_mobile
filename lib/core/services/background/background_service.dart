import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';

class BackgroundService {
  BackgroundService._internal();

  static final BackgroundService _instance = BackgroundService._internal();
  static BackgroundService get instance => _instance;

  Future<void> initBackgroundService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onServiceStart,
        autoStart: false,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: false,
        onForeground: onServiceStart,
        onBackground: onIosBackground,
      ),
    );
  }
}

@pragma('vm:entry-point')
void onServiceStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  StreamSubscription<Position>? positionSub;

  /// Get setting data from UI
  LocationSettings buildSettings(Map<String, dynamic> data) {
    final accuracy = LocationAccuracy.values.firstWhere(
      (e) => e.name == (data['accuracy'] ?? 'high'),
      orElse: () => LocationAccuracy.high,
    );
    final distanceFilter = (data['distanceFilter'] ?? 10) as int;

    final timeLimitInSecond = data['timeLimitInSecond'] as int?;

    return LocationSettings(
      accuracy: accuracy,
      distanceFilter: distanceFilter,
      timeLimit: timeLimitInSecond != null
          ? Duration(seconds: timeLimitInSecond)
          : null,
    );
  }

  void startStream(Map<String, dynamic> settingsData) {
    positionSub?.cancel();

    final settings = buildSettings(settingsData);

    positionSub = Geolocator.getPositionStream(locationSettings: settings)
        .listen(
          (Position position) {
            // Avoid bad accuracy to help save device power
            if (position.accuracy > 20) return;

            service.invoke('locationUpdate', {
              'lat': position.latitude,
              'lng': position.longitude,
              'accuracy': position.accuracy.toInt(),
              'speed': position.speed,
              'timestamp': position.timestamp.toIso8601String(),
            });
          },
          onError: (error) {
            if (error is TimeoutException) {
              service.invoke('timeoutException');
            } else {
              service.invoke('permissionException');
            }

            positionSub?.cancel();
            service.stopSelf();
          },
        );
  }

  service.on('startTracking').listen((data) {
    if (data == null) return;
    startStream(data);
  });

  service.on('stopTracking').listen((event) {
    positionSub?.cancel();
    service.stopSelf();
  });
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}
