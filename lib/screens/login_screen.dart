import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Lütfen tüm alanları doldurun!'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
      return;
    }

    context.go('/home');
  }

  void navigateToRegister() {
    context.go('/register');
  }

  void navigateToHome() {
    context.go('/home');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home), 
          onPressed: navigateToHome,
          iconSize: 30, 
        color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0), 
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary, 
                  ),
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-Posta',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary, 
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              style: TextStyle(
    color: Theme.of(context).colorScheme.primary, 
  ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Şifre',
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary, 
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              style: TextStyle(
    color: Theme.of(context).colorScheme.primary,
              )
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Giriş Yap'),
            ),
            const SizedBox(height: 12),

ElevatedButton(
  onPressed: navigateToRegister,
  style: ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50), 
    iconColor: Theme.of(context).colorScheme.primary, 
  ),
  child: const Text(
    'Kayıt Ol',
      style: TextStyle(
      fontSize: 16
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
