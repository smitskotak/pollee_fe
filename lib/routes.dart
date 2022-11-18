import 'package:flutter/material.dart';
import 'package:pollee/screens/create_poll/create_poll_screen.dart';
import 'package:pollee/screens/dashboard/dashboard_screen.dart';
import 'package:pollee/screens/login.dart';

class RouteNames {
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const polls = '/polls';
  static const managePolls = '/manage_polls';
  static const createPoll = '/create_poll';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteNames.login: (_) => const LoginScreen(),
  RouteNames.dashboard: (_) => const DashboardScreen(),
  RouteNames.createPoll: (_) => const CreatePollScreen(),
};
