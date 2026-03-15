import 'package:flutter/material.dart';
import 'package:routezy_mobile/app/app.dart';
import 'package:routezy_mobile/core/injections/dependency_injections.dart';
import 'package:routezy_mobile/core/services/background/background_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjections.initialize();

  /// Initialize Background Service
  await BackgroundService.instance.initBackgroundService();

  runApp(const App());
}
