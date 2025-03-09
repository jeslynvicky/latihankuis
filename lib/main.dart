import 'package:flutter/material.dart';
import 'package:pertemuan2/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,

      // Tema terang dengan font khusus
      theme: ThemeData(
        fontFamily: 'Montserrat', // Tambahkan di sini
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.black),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
          ),
        ),
      ),

      // Tema gelap dengan font khusus
      darkTheme: ThemeData(
        fontFamily: 'Montserrat', // Tambahkan di sini
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.white),
            foregroundColor: const WidgetStatePropertyAll(Colors.black),
          ),
        ),
      ),

      home: const LoginPage(),
    );
  }
}
