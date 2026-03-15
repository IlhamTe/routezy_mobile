import 'package:flutter/widgets.dart';

class SizeHelper {
  SizeHelper._();

  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;
  static double _statusBarHeight = 0.0;
  static double _bottomBarHeight = 0.0;

  /// This is UI default width size of figma
  /// You can replace with your figma project
  static final double _defaultUIWidth = 360.0;

  static void init(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _statusBarHeight = MediaQuery.of(context).viewPadding.top;
    _bottomBarHeight = MediaQuery.of(context).viewPadding.bottom;
  }

  // Get current screen width
  static double get getScreenWidth => _screenWidth;

  // Get current screen height
  static double get getScreenHeight => _screenHeight;

  // Get status bar height
  static double get getStatusBarHeight => _statusBarHeight;

  // Get bottom bar height
  static double get getBottomBarHeight => _bottomBarHeight;

  // Get default UI Width
  static double get getDefaultUIWidth => _defaultUIWidth;

  static double dynamicSize(double value) {
    final width = getScreenWidth;
    final scale = width / _defaultUIWidth;
    return value * scale; // Scale the value proportionally
  }
}
