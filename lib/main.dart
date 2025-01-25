import 'package:flutter/material.dart';
import 'package:flutter_app/core/themes.dart';
import 'package:flutter_app/screens/register_screen.dart';
import 'package:go_router/go_router.dart';
import 'screens/loading_screen.dart'; 
import 'screens/home_screen.dart'; 
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;


  void _toggleTheme() {
    setState(() {
      _themeMode = (_themeMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    });
  }

  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      initialLocation: '/home', 
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
            return HomeScreen(
              onThemeChange: _toggleTheme, 
            ); 
          },
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

    return MaterialApp.router(
      routerConfig: _router,
      themeMode: _themeMode, 
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
