import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register() {
    if (nameController.text.isEmpty || surnameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
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

  void navigateToLogin() {
    context.go('/login');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          iconSize: 30,
          color: Theme.of(context).colorScheme.primary,
          onPressed: () => context.go('/home'),
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
                  'Kayıt Ol',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            // Ad TextField
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Ad',
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
            // Soyad TextField
            TextField(
              controller: surnameController,
              decoration: InputDecoration(
                labelText: 'Soyad',
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
            // E-posta TextField
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
            // Şifre TextField
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
  ),
            ),
            const SizedBox(height: 24),
            // Kayıt Ol Butonu
            ElevatedButton(
              onPressed: register,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Kayıt Ol'),
            ),
            const SizedBox(height: 12),
            // Giriş Yap Butonu
            TextButton(
              onPressed: navigateToLogin,
              child: const Text('Zaten bir hesabınız var? Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
