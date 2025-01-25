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
  bool _isDarkMode = false; 

Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      themeMode:
          _isDarkMode ? ThemeMode.dark : ThemeMode.light, 
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode; 
    });
  }
}

    final router = GoRouter(
      initialLocation: '/loading', 
  routes: [
    GoRoute(
      path: '/loading',
      builder: (context, state) => const LoadingScreen(),
    ),
       GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomeScreen(
          onThemeChange: () {
            final appState = context.findAncestorStateOfType<_MyAppState>();
            appState?.toggleTheme(); 
          },
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
