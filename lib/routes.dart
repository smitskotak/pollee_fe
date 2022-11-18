import 'package:flutter/material.dart';
import 'package:pollee/screens/create_poll/create_poll_screen.dart';
import 'package:pollee/screens/dashboard/dashboard_screen.dart';
import 'package:pollee/screens/login.dart';
import 'package:pollee/screens/manage_polls/manage_polls_screen.dart';
import 'package:pollee/screens/polls_list/polls_list_screen.dart';

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
  RouteNames.polls: (_) => const PollsListScreen(),
  RouteNames.managePolls: (_) => const ManagePollsListScreen(),
  RouteNames.createPoll: (_) => const CreatePollScreen(),
};
