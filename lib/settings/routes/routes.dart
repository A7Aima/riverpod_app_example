import 'package:flutter/material.dart';
import 'package:riverpod_app/ui/fetch_cities/fetch_cities.dart';
import 'package:riverpod_app/ui/fetch_detail_screen/fetch_detail_screen.dart';
import 'package:riverpod_app/ui/fetch_states/fetch_states.dart';
import 'package:riverpod_app/ui/show_final_results/show_final_results.dart';
import 'package:riverpod_app/ui/splash_screen/splash_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String splashScreen = "/splashScreen";
  static const String fetchDetailScreen = "/fetchDetailScreen";
  static const String fetchState = "/fetchState";
  static const String fetchCity = "/fetchCity";
  static const String showFinalResults = "/showFinalResults";

  static Route animateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case fetchDetailScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => FetchDetailScreen(),
        );
      case fetchState:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => FetchStates(),
        );
      case fetchCity:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => FetchCities(),
        );
      case showFinalResults:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ShowFinalResult(),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SplashScreen(),
        );
    }
  }
}
