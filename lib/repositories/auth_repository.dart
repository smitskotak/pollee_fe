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

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(
        '/auth/signin',
        data: {
          'email': email,
          'password': password,
        },
      );
      final user = User.fromJson(response.data);
      return user;
    } catch (err) {
      return null;
    }
  }

  Future<bool> signUp({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(
        '/auth/signup',
        data: {
          'name': name,
          'username': username,
          'email': email,
          'password': password
        },
      );
      return response.data['success'] == true;
    } catch (_) {
      return false;
    }
  }
}
