import 'package:flutter/material.dart';
import 'package:pollee/repositories/user_repository.dart';
import 'package:pollee/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => UserRepository(),
      child: MaterialApp(
        title: 'Pollee - Roll & Collect polls',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routes: appRoutes,
        initialRoute: RouteNames.login,
      ),
    );
  }
}
