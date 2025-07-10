import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/presentation/features/movie_ditails/presentation/movie_ditails.dart';
import 'package:kino_rant/presentation/features/movies/domain/entities/movie.dart';
import 'package:kino_rant/presentation/layout/auth_shell.dart';
import 'package:kino_rant/presentation/layout/main_shell.dart';
import 'package:kino_rant/presentation/features/auth/login_screen.dart';
import 'package:kino_rant/presentation/features/auth/register_screen.dart';
import 'package:kino_rant/presentation/features/movies/presentation/screens/movies_list.dart';
import 'package:kino_rant/presentation/features/main/second.dart';
import 'package:kino_rant/presentation/features/main/pofile.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) => AuthShell(child: child),
        routes: [
          GoRoute(
            path: '/login',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: LoginScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
              );
            },
          ),
          GoRoute(
            path: '/register',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: RegisterScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      final offsetTween = Tween<Offset>(
                        begin: Offset(0, -1),
                        end: Offset.zero,
                      );
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: offsetTween.animate(animation),
                          child: child,
                        ),
                      );
                    },
              );
            },
          ),
        ],
      ),

      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/main',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: MoviesList(),
                transitionsBuilder:
                    (context, animation, secondAnimation, child) {
                      return RotationTransition(turns: animation, child: child);
                    },
              );
            },
          ),
          GoRoute(
            path: '/second',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: Second(),
                transitionsBuilder:
                    (context, animation, secondAnimation, child) {
                      return RotationTransition(turns: animation, child: child);
                    },
              );
            },
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: Profile(),
                transitionsBuilder:
                    (context, animation, secondAnimation, child) {
                      return RotationTransition(turns: animation, child: child);
                    },
              );
            },
          ),

        ],
      ),
      GoRoute(path: '/movie', builder: (context, state) {
        final movie = state.extra as Movie;
        return MovieDitails(movie: movie);

      },)
    ],
  );
}
