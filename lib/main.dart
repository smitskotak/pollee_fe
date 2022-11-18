import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
        Provider<PollsRepository>(
          create: (context) {
            final userRepo = context.read<UserRepository>();
            final dio = Dio(
              BaseOptions(
                baseUrl:
                    'http://ec2-13-126-46-97.ap-south-1.compute.amazonaws.com:8082/api',
              ),
            );
            dio.interceptors.add(AuthInterceptor(userRepo));
            return PollsRepository(apiClient: Dio());
          },
        ),
      ],
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
