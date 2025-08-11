import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/features/auth/bloc/auth_state.dart';
import 'package:kino_rant/features/auth/domain/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;
  
  AuthCubit(this.repository) : super(AuthInitial()) {
    repository.authStateChanges.listen((user) {
      emit(
        user != null ? AuthAuthenticated(user: user) : AuthUnauthenticated(),
      );
    });
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await repository.singIn(email, password);
      emit(AuthAuthenticated(user: user!));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> register(String email, String password, String name) async {
    emit(AuthLoading());
    try {
      final user = await repository.singUp(email, password, name);
      emit(AuthAuthenticated(user: user!));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> logout() async {
    await repository.singOut();
    emit(AuthUnauthenticated());
  }
}
