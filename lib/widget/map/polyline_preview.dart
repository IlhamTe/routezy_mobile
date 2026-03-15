import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as lat_long_2;
import 'package:routezy_mobile/app/design_system/app_color.dart';

class PolylinePreview extends StatelessWidget {
  const PolylinePreview({
    super.key,
    required this.coordinates,
    this.customSize,
  });

  final List<lat_long_2.LatLng> coordinates;

  final Size? customSize;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: customSize ?? const Size(60, 60),
      painter: _PolylinePainter(
        coordinates,
        lineColor: AppColors.primaryMain,
        gapLength: 2.0,
        dashLength: 2.0,
        strokeWidth: 2.0,
      ),
    );
  }
}

class _PolylinePainter extends CustomPainter {
  final List<lat_long_2.LatLng> points;
  final Color lineColor;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  _PolylinePainter(
    this.points, {
    required this.lineColor,
    required this.strokeWidth,
    required this.dashLength,
    required this.gapLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Convert LatLng -> Offset (normalize into canvas)
    final minLat = points
        .map((p) => p.latitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLat = points
        .map((p) => p.latitude)
        .reduce((a, b) => a > b ? a : b);
    final minLng = points
        .map((p) => p.longitude)
        .reduce((a, b) => a < b ? a : b);
    final maxLng = points
        .map((p) => p.longitude)
        .reduce((a, b) => a > b ? a : b);

    final latRange = maxLat - minLat;
    final lngRange = maxLng - minLng;

    final List<Offset> offsets = points.map((p) {
      final dx =
          ((p.longitude - minLng) / (lngRange == 0 ? 1 : lngRange)) *
          size.width;
      final dy =
          size.height -
          ((p.latitude - minLat) / (latRange == 0 ? 1 : latRange)) *
              size.height;
      return Offset(dx, dy);
    }).toList();

    // Draw dashed polyline
    final path = Path()..moveTo(offsets.first.dx, offsets.first.dy);
    for (var i = 1; i < offsets.length; i++) {
      path.lineTo(offsets[i].dx, offsets[i].dy);
    }

    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final extractPath = metric.extractPath(distance, distance + dashLength);
        canvas.drawPath(extractPath, paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _PolylinePainter oldDelegate) {
    return oldDelegate.points != points ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
