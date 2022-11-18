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
  bool _isSubmitting = false;
  late TextEditingController nameTF;
  late TextEditingController usernameTF;
  late TextEditingController emailTF;
  late TextEditingController passwordTF;

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MaterialSegmentedControl(
                    selectionIndex: _currentIndex,
                    selectedColor: Theme.of(context).colorScheme.primary,
                    unselectedColor: Theme.of(context).colorScheme.background,
                    borderColor: Theme.of(context).colorScheme.primary,
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
                    decoration: const InputDecoration(
                      hintText: 'Enter name here...',
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: usernameTF,
                    decoration: const InputDecoration(
                      hintText: 'Enter username here...',
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                TextField(
                  controller: emailTF,
                  decoration: const InputDecoration(
                    hintText: 'Enter email here...',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordTF,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 56),
                if (_isSubmitting)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
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
      ),
    );
  }

  Future<void> signIn() async {
    setState(() {
      _isSubmitting = true;
    });
    final user = await context.read<AuthRepository>().signIn(
          email: emailTF.text,
          password: passwordTF.text,
        );
    setState(() {
      _isSubmitting = false;
    });
    if (!mounted) {
      return;
    }
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect id or password!'),
        ),
      );
      return;
    }
    context.read<UserRepository>().user = user;
    await Navigator.of(context).pushReplacementNamed(RouteNames.dashboard);
  }

  Future<void> signUp() async {
    setState(() {
      _isSubmitting = true;
    });
    final isSignedUp = await context.read<AuthRepository>().signUp(
          email: emailTF.text,
          password: passwordTF.text,
          name: nameTF.text,
          username: usernameTF.text,
        );
    setState(() {
      _isSubmitting = false;
    });
    if (!mounted) {
      return;
    }
    if (!isSignedUp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not sign up! Retry later.'),
        ),
      );
      return;
    }
    await signIn();
  }
}
