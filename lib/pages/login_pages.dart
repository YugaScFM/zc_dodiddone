import 'package:flutter/material.dart';
import 'package:zc_dodiddone/theme/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRegistration = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _isRegistration
                ? [
                    DodiddoneTheme.lightTheme.colorScheme.primary,
                    DodiddoneTheme.lightTheme.colorScheme.secondary,
                  ]
                : [
                    DodiddoneTheme.lightTheme.colorScheme.secondary,
                    DodiddoneTheme.lightTheme.colorScheme.primary,
                  ],
            stops: const [0.1, 0.9],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Dodiddone',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Логин',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Пароль',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Здесь вы можете добавить логику для выполнения входа
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      DodiddoneTheme.lightTheme.colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Войти'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isRegistration = !_isRegistration;
                  });
                },
                style: TextButton.styleFrom(
                  foregroundColor:
                      DodiddoneTheme.lightTheme.colorScheme.primary,
                ),
                child: Text(
                  _isRegistration
                      ? 'У меня уже есть аккаунт'
                      : 'У меня еще нет аккаунта',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}