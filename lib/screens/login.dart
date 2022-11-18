import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:pollee/repositories/auth_repository.dart';
import 'package:pollee/repositories/user_repository.dart';
import 'package:pollee/routes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginWidget();
  }
}

class _LoginWidget extends StatefulWidget {
  const _LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<_LoginWidget> {
  int _currentIndex = 0;
  late TextEditingController nameTF;
  late TextEditingController usernameTF;
  late TextEditingController emailTF;
  late TextEditingController passwordTF;

  // bool get _enableContinueButton {
  //   final hasError = [
  //     if (_currentIndex == 1) ...[
  //       _usernameError,
  //       _nameError,
  //     ],
  //     _emailError,
  //     _passwordError
  //   ].map((e) => e != null).reduce((value, element) => value || element);
  //   return !hasError;
  // }

  // String? _nameError;
  // String? _usernameError;
  // String? _emailError;
  // String? _passwordError;

  @override
  void initState() {
    nameTF = TextEditingController();
    usernameTF = TextEditingController();
    emailTF = TextEditingController();
    passwordTF = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Pollee 👋'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: MaterialSegmentedControl(
                  selectionIndex: _currentIndex,
                  selectedColor: Theme.of(context).primaryColor,
                  unselectedColor: Theme.of(context).cardColor,
                  borderColor: Theme.of(context).primaryColor,
                  children: const {
                    0: Text('Login'),
                    1: Text('Register'),
                  },
                  onSegmentChosen: (index) => setState(() {
                    _currentIndex = index;
                  }),
                ),
              ),
              if (_currentIndex == 1) ...[
                TextField(
                  controller: nameTF,
                  decoration: InputDecoration(
                    hintText: 'Enter name here...',
                    labelText: 'Name',
                    // errorText: _nameError,
                  ),
                  /* onChanged: (value) {
                    setState(() {
                      if (value.trim().isEmpty) {
                        _nameError = 'Required!';
                      } else {
                        _nameError = null;
                      }
                    });
                  }, */
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: usernameTF,
                  decoration: InputDecoration(
                    hintText: 'Enter username here...',
                    labelText: 'Username',
                    // errorText: _usernameError,
                  ),
                  /* onChanged: (value) {
                    setState(() {
                      if (value.trim().isEmpty) {
                        _usernameError = 'Required!';
                      } else {
                        _usernameError = null;
                      }
                    });
                  }, */
                ),
                const SizedBox(height: 8),
              ],
              TextField(
                controller: emailTF,
                decoration: InputDecoration(
                  hintText: 'Enter email here...',
                  labelText: 'Email',
                  // errorText: _emailError,
                ),
                keyboardType: TextInputType.emailAddress,
                /* onChanged: (value) {
                  setState(() {
                    if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      _emailError = 'Required!';
                    } else {
                      _emailError = null;
                    }
                  });
                }, */
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordTF,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  // errorText: _passwordError,
                ),
                /* onChanged: (value) {
                  setState(() {
                    if (value.trim().isEmpty) {
                      _passwordError = 'Required!';
                    } else {
                      _passwordError = null;
                    }
                  });
                }, */
              ),
              const SizedBox(height: 56),
              ElevatedButton(
                onPressed: () {
                  if (_currentIndex == 0) {
                    signIn();
                  } else {
                    signUp();
                  }
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final user = await context.read<AuthRepository>().signIn(
          email: emailTF.text,
          password: passwordTF.text,
        );
    if (!mounted) {
      return;
    }
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect id or password!'),
        ),
      );
    }
    context.read<UserRepository>().user = user;
    await Navigator.of(context).pushReplacementNamed(RouteNames.dashboard);
  }

  Future<void> signUp() async {}
}
