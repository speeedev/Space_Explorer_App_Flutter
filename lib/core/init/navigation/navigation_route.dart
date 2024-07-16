import 'package:flutter/material.dart';
import 'package:space_explorer/core/constants/navigation/navigation_constants.dart';
import 'package:space_explorer/core/init/models/planet_model.dart';
import 'package:space_explorer/features/home/presentation/home_view.dart';
import 'package:space_explorer/features/planet_detail/presentation/planet_detail_view.dart';
import 'package:space_explorer/features/splash/presentation/splash_view.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.INITIAL:
        return normalNavigate(const SplashView());

      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());

      case NavigationConstants.PLANET_DETAIL:
        // data, planetmodel
        final planet = args.arguments as PlanetModel;
        return normalNavigate(PlanetDetailView(planet: planet));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${args.name}'),
            ),
          ),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
