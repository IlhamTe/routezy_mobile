import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapUtil {
  MapUtil._();

  static double calculateTotalDistance(List<LatLng> polylinePoints) {
    double totalDistance = 0.0;

    for (int i = 0; i < polylinePoints.length - 1; i++) {
      /// Get current coordinate
      double startLat = polylinePoints[i].latitude;
      double startLng = polylinePoints[i].longitude;

      /// Get next coordinate
      double endLat = polylinePoints[i + 1].latitude;
      double endLng = polylinePoints[i + 1].longitude;

      double distance = Geolocator.distanceBetween(
        startLat,
        startLng,
        endLat,
        endLng,
      );

      totalDistance += distance;
    }

    /// Return total distance in kilometer
    return double.parse((totalDistance / 1000).toStringAsFixed(2));
  }

  static LatLng getCenterFromRoutes(List<LatLng> routes) {
    final avgLat =
        routes.map((p) => p.latitude).reduce((a, b) => a + b) / routes.length;
    final avgLng =
        routes.map((p) => p.longitude).reduce((a, b) => a + b) / routes.length;

    return LatLng(avgLat, avgLng);
  }
}
