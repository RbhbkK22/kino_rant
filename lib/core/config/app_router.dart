import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/presentation/layout/auth_shell.dart';
import 'package:kino_rant/presentation/layout/main_shell.dart';
import 'package:kino_rant/presentation/features/auth/login_screen.dart';
import 'package:kino_rant/presentation/features/auth/register_screen.dart';
import 'package:kino_rant/presentation/features/main/muvies_list.dart';
import 'package:kino_rant/presentation/features/main/second.dart';

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
                child: MuviesList(),
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
        ],
      ),
    ],
  );
}
