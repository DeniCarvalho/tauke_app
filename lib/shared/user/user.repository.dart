import 'models/user.model.dart';

abstract class UserRepository {
  Future<User> login(String email, String password);
  Future<User> me();
}
