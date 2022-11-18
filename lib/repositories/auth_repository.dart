import 'package:dio/dio.dart';
import 'package:pollee/models/user.dart';
import 'package:pollee/repositories/user_repository.dart';

class AuthRepository {
  AuthRepository({
    required this.apiClient,
    required this.userRepository,
  });

  final Dio apiClient;
  final UserRepository userRepository;

  Future<User> signIn({
    required String userid,
    required String password,
  }) async {
    final response = await apiClient.post('/auth/signin');
    final user = User.fromJson(response.data);
    return user;
  }
}
