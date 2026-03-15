import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:routezy_mobile/core/utils/show_widget_helper.dart';
import 'package:routezy_mobile/widget/bottom_sheet/location_permission_alert_bottom_sheet.dart';

class LocationPermissionUtil {
  LocationPermissionUtil._();

  static Future<void> requestLocationServiceWithAlert({
    required BuildContext context,
    required VoidCallback onLocationAllowed,
  }) async {
    /// Initialize Variable
    BuildContext currentContext = context;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    PermissionStatus androidLocationPermissionStatus =
        await Permission.location.status;
    LocationPermission iosLocationPermissionStatus =
        await Geolocator.checkPermission();

    /// Check Location Service
    if (!isLocationServiceEnabled && Platform.isAndroid) {
      if (currentContext.mounted) {
        _showErrorDeviceLocationService(
          context: currentContext,
          onTapButton: (bottomSheetContext) async {
            await Geolocator.openLocationSettings();

            if (currentContext.mounted) {
              Navigator.pop(bottomSheetContext);
            }
          },
        );
      }
      return;
    }

    /// Check Location Permission
    if (Platform.isAndroid) {
      if (androidLocationPermissionStatus.isDenied) {
        await Permission.location.request();

        if (currentContext.mounted) {
          requestLocationServiceWithAlert(
            context: currentContext,
            onLocationAllowed: onLocationAllowed,
          );
        }
        return;
      }
    } else if (Platform.isIOS) {
      if (iosLocationPermissionStatus == LocationPermission.denied) {
        await Geolocator.requestPermission();

        if (currentContext.mounted) {
          requestLocationServiceWithAlert(
            context: currentContext,
            onLocationAllowed: onLocationAllowed,
          );
        }
        return;
      }
    }

    if (androidLocationPermissionStatus.isPermanentlyDenied ||
        iosLocationPermissionStatus == LocationPermission.deniedForever) {
      if (currentContext.mounted) {
        _showErrorDeviceLocationService(
          context: currentContext,
          onTapButton: (bottomSheetContext) async {
            await openAppSettings();

            if (currentContext.mounted) {
              Navigator.pop(bottomSheetContext);
            }
          },
        );
      }

      return;
    }

    /// END of Check Location Permission

    onLocationAllowed();
  }

  static Future<void> requestLocationPermission() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (Platform.isAndroid) {
      final locationPermissionStatus = await Permission.location.status;

      if (!isLocationServiceEnabled) {
        await Geolocator.openLocationSettings();
        return;
      }

      if (locationPermissionStatus == PermissionStatus.denied) {
        await Permission.location.request();
      }
    } else if (Platform.isIOS) {
      final locationPermissionStatus = await Geolocator.checkPermission();

      if (locationPermissionStatus == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
    }
  }

  static void _showErrorDeviceLocationService({
    required BuildContext context,
    required ValueChanged<BuildContext> onTapButton,
  }) {
    ShowWidgetHelper.showCustomModalBottomSheet(
      context: context,
      enableDrag: true,
      builder: (bottomSheetContext) {
        return LocationPermissionAlertBottomSheet();
      },
    );
  }
}
