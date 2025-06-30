import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/core/config/app_router.dart';
import 'package:kino_rant/presentation/features/auth/bloc/auth_cubit.dart';
import 'package:kino_rant/presentation/features/auth/data/auth_repository_impl.dart';
import 'package:kino_rant/presentation/features/auth/data/firebase_auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authRepository = AuthRepositoryImpl(FirebaseAuthService());

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AuthCubit(authRepository))],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: "Huninn"),
      routerConfig: _appRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
