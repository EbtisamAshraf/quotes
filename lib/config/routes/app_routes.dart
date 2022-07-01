import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/favourite_quote/presentation/pages/favourite_qoute_screen.dart';
import 'package:quotes/features/random_quote/presentation/pages/quote_screen.dart';


class Routes {
  static const String initRoute = '/';
  static const String favouriteRoute = '/favourite';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(
            builder: (_) => const QuoteScreen(),
                );

      case Routes.favouriteRoute:
        return MaterialPageRoute(builder: (_) => const FavouriteQouteScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
