import 'package:flutter/material.dart';
import 'package:pollee/screens/create_poll/create_poll_screen.dart';
import 'package:pollee/screens/login.dart';

class RouteNames {
  static const login = '/login';
  static const createPoll = '/create_poll';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteNames.login: (_) => const LoginScreen(),
  RouteNames.createPoll: (_) => const CreatePollScreen(),
};
