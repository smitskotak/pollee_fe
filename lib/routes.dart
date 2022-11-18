import 'package:flutter/material.dart';
import 'package:pollee/screens/login.dart';

class RouteNames {
  static const login = '/login';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteNames.login: (_) => const LoginScreen(),
};
