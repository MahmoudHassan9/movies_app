import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/presentation/screens/home_screen/home_screen.dart';
import 'package:movies_app/routing/routes.dart';


abstract class AppRouter {
  static Route? router(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
    return null;
  }
}
