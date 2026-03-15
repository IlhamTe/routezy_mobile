import 'package:flutter/material.dart';

final router = RouteUtil();

class RouteUtil {
  /// Global key to use in navigator
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  BuildContext? get currentContext => _navigatorKey.currentContext;

  /// Navigating to some screen using [routeName] and optional
  /// argument [data]
  Future<dynamic> pushTo(String routeName, {dynamic data}) =>
      _navigatorKey.currentState!.pushNamed(routeName, arguments: data);

  Future<dynamic> pushReplacement(String routeName, {dynamic data}) =>
      _navigatorKey.currentState!.pushReplacementNamed(
        routeName,
        arguments: data,
      );

  /// Navigating to some screen using [routeName] and optional
  /// argument [data], this function include clear all navigation stack
  Future<dynamic> pushToRemoveUntil(String routeName, {dynamic data}) =>
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName,
        (route) => false,
        arguments: data,
      );
  BuildContext? get context => _navigatorKey.currentContext;

  /// Navigating back using pop,
  /// with optional argument [data]
  dynamic pop({dynamic data}) => _navigatorKey.currentState!.maybePop(data);

  void popUntil(String routeName) =>
      _navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));

  void popAndPush(String routeName, {dynamic data}) =>
      _navigatorKey.currentState!.popAndPushNamed(routeName, arguments: data);

  void popUntilFirst() =>
      _navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
