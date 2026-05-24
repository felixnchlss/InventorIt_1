import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const InventorItApp());
}

class InventorItApp extends StatelessWidget {
  const InventorItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InventorIt Prototype',
      debugShowCheckedModeBanner: false, // Menghilangkan pita 'DEBUG' di pojok kanan atas
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      // Aplikasi dimulai dari halaman Login
      home: const LoginScreen(), 
    );
  }
}