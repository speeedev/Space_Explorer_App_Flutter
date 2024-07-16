import 'package:flutter/material.dart';
import 'package:space_explorer/core/init/navigation/navigation_service_base.dart';

class NavigationService implements NavigationServiceBase {
  NavigationService._init();
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }
  @override
  void back() {
    navigatorKey.currentState!.pop();
  }
}