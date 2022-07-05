import 'package:flutter/material.dart';
import 'package:musicplayer/screens/admin/dashboard_screen.dart';

import 'constant.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case dashboardRoute:
      return MaterialPageRoute(builder: (_) => DashboardScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
