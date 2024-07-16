import 'package:flutter/material.dart';
import 'package:route_task/core/routes/routes.dart';
import 'package:route_task/features/home/presentation/pages/home.dart';

class AppRoutes {
  final BuildContext context;

  AppRoutes(this.context);

  static Route? onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return null;
    }
  }
}
