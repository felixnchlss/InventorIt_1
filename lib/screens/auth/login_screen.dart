import 'package:flutter/material.dart';
import '../admin/admin_dashboard.dart';
import '../student/student_dashboard.dart';
// Asumsikan Anda sudah punya widget ini sesuai referensi Anda:
// import '../../widgets/my_button.dart'; 
// import '../../widgets/my_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void manualSignIn() {
    String email = emailController.text.trim().toLowerCase();
    
    // Logika Role Sederhana
    if (email.contains('admin') || email.contains('staff')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdminDashboard()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StudentDashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.biotech, size: 100), // Ikon Lab
                const SizedBox(height: 50),
                const Text('InventorIt - Lab Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 25),
                // Ganti dengan MyTextFormField milik Anda
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email (contoh: admin@binus.ac.id atau student@)'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password (bebas)'),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: manualSignIn,
                  style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                  child: const Text("Sign In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}