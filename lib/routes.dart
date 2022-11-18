import 'package:flutter/material.dart';
//import 'package:pollee/screens/login.dart';
import 'package:pollee/screens/logincopy.dart';

class RouteNames {
  //static const login = '/login';

  static const segmentedWidget = '/SegmentedWidget';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  //RouteNames.login: (_) => const LoginScreen(),
  RouteNames.segmentedWidget: (_) => const SegmentedWidget()
};
