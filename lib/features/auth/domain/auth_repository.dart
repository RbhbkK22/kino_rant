import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> singIn(String email, String password);
  Future<User?> singUp(String email, String password, String name);
  Future<void> singOut();
  Stream<User?> get authStateChanges;
}
