import 'package:flutter/material.dart';
import 'package:kino_rant/core/config/app_router.dart';

void main() {
  runApp(MainApp());
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
