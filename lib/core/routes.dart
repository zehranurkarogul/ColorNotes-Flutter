import 'package:flutter/material.dart';
import 'package:flutter_app/screens/register_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart'; 

final GoRouter router = GoRouter(
  initialLocation: '/', 
  routes: [
    GoRoute(
      path: '/', 
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home', 
      builder: (context, state) => HomeScreen(
        onThemeChange: () {}, 
      ),
    ),
    GoRoute(
      path: '/login', 
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),
  ],
);