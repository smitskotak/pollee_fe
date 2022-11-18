import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pollee/color_schemes.dart';
import 'package:pollee/constants.dart';
import 'package:pollee/repositories/auth_repository.dart';
import 'package:pollee/repositories/polls_repository.dart';
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
    return MultiProvider(
      providers: [
        Provider<UserRepository>(create: (_) => UserRepository()),
        Provider<AuthRepository>(
          create: (context) => AuthRepository(
            apiClient: Dio(
              BaseOptions(
                baseUrl: baseUrl,
              ),
            ),
            userRepository: context.read<UserRepository>(),
          ),
        ),
        Provider<PollsRepository>(
          create: (context) {
            final userRepo = context.read<UserRepository>();
            final dio = Dio(
              BaseOptions(
                baseUrl: baseUrl,
              ),
            );
            dio.interceptors.add(AuthInterceptor(userRepo));
            return PollsRepository(apiClient: dio);
          },
        ),
      ],
      child: MaterialApp(
        title: 'Pollee - Roll & Collect polls',
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        routes: appRoutes,
        initialRoute: RouteNames.login,
      ),
    );
  }
}

class AuthInterceptor extends Interceptor {
  final UserRepository userRepository;

  AuthInterceptor(this.userRepository);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = userRepository.user?.token;
    options.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    super.onRequest(options, handler);
  }
}
