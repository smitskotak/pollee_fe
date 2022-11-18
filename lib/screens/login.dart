// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable, prefer_typing_uninitialized_variables
    // ignore: unused_local_variable

    Widget buildSegment(String text) => Container(
          padding: const EdgeInsets.all(12),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );

    return Scaffold(
        body: ListView(
      children: [
        CupertinoSegmentedControl<int>(
            padding: const EdgeInsets.all(10),
            groupValue: groupValue,
            selectedColor: Theme.of(context).colorScheme.primary,
            unselectedColor: Theme.of(context).colorScheme.primary,
            borderColor: Theme.of(context).colorScheme.primary,
            pressedColor: Theme.of(context).colorScheme.primary,
            children: {
              0: buildSegment('Login'),
              1: buildSegment('Register'),
            },
            onValueChanged: (groupValue) {
              // ignore: avoid_print
              print(groupValue);
              setState(() {
                // ignore: unused_local_variable
                //int groupValue  = 0;
                this.groupValue = groupValue;
              });
            })
      ],
    ));
  }
}
