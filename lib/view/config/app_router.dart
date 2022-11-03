import 'package:flutter/material.dart';

import '../screens/screens_export.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    //Debug: print route name then method called
    print('This is route name: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case '/add':
        return AddRecipeScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
      ),
    );
  }
}
