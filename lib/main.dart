import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/loading_screen.dart'; 
import 'screens/home_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/loading', 
      routes: [
        GoRoute(
          path: '/loading',
          builder: (context, state) {
            return const LoadingScreen(); 
          },
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) {
            return const HomeScreen(); 
          },
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
