import 'package:firebase_auth/firebase_auth.dart';
import 'package:kino_rant/features/auth/data/firebase_auth_service.dart';
import 'package:kino_rant/features/auth/domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService service;

  AuthRepositoryImpl(this.service);

  @override
  Stream<User?> get authStateChanges => service.authStateChanges;

  @override
  Future<User?> singIn(String email, String password) =>
      service.singIn(email, password);

  @override
  Future<void> singOut() => service.singOut();

  @override
  Future<User?> singUp(String email, String password, String name) =>
      service.singUp(email, password, name);
}
