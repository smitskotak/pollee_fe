import 'package:pollee/models/user.dart';

class UserRepository {
  User? user;

  bool get isUserAdmin => user?.role == 'ADMIN';
}
