import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kino_rant/core/config/app_router.dart';
import 'package:kino_rant/presentation/features/auth/bloc/auth_cubit.dart';
import 'package:kino_rant/presentation/features/auth/data/auth_repository_impl.dart';
import 'package:kino_rant/presentation/features/auth/data/firebase_auth_service.dart';
import 'package:kino_rant/presentation/features/comments/data/comments_repository_impl.dart';
import 'package:kino_rant/presentation/features/comments/data/comments_service.dart';
import 'package:kino_rant/presentation/features/movie_ditails/presentation/bloc/combinated/combinatad_cubit_ditails.dart';
import 'package:kino_rant/presentation/features/comments/presintation/bloc/review_bloc.dart';
import 'package:kino_rant/presentation/features/movie_ditails/data/movie_ditails_service.dart';
import 'package:kino_rant/presentation/features/movie_ditails/presentation/bloc/ditails_bloc.dart';
import 'package:kino_rant/presentation/features/movies/data/movie_api_client.dart';
import 'package:kino_rant/presentation/features/movies/data/movie_repository_impl.dart';
import 'package:kino_rant/presentation/features/movies/presentation/bloc/movies_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyC0PQJ_p_P9kjpErlxx1aDbys75iLB8o7o",
        authDomain: "kino-rant.firebaseapp.com",
        projectId: "kino-rant",
        storageBucket: "kino-rant.firebasestorage.app",
        messagingSenderId: "754041145265",
        appId: "1:754041145265:web:aae2929c51382fa416df90",
        measurementId: "G-ER8W16P75Q",
      ),
    );
  }
  await Firebase.initializeApp();

  final authRepository = AuthRepositoryImpl(FirebaseAuthService());

  final apiClient = MovieApiClient();
  final movieRepositoy = MovieRepositoryImpl(apiClient: apiClient);

  final reviewRepository = CommentsRepositoryImpl(
    commentsService: CommentsService(),
  );

  final ditails = MovieDitailsService();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(authRepository)),
        BlocProvider(create: (_) => MoviesBloc(repository: movieRepositoy)),
        BlocProvider(
          create: (_) => ReviewBloc(commentsRepositoryImpl: reviewRepository),
        ),
        BlocProvider(create: (_) => DitailsBloc(service: ditails)),
        BlocProvider(
          create: (context) => CombinatadCubitDitails(
            ditailsBloc: context.read<DitailsBloc>(),
            reviewBloc: context.read<ReviewBloc>(),
          ),
        ),
      ],
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
      theme: ThemeData(
        progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
        dividerColor: Colors.white,
        fontFamily: "Huninn",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFFEB2F3D)),
          ),
        ),
      ),
      routerConfig: _appRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
