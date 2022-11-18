import 'package:flutter/material.dart';
import 'package:pollee/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: 50,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            'Hello World',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(RouteNames.dashboard);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
