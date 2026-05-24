import 'package:flutter/material.dart';
import '../auth/login_screen.dart';
import 'admin_monitoring_screen.dart';
import 'item_input_screen.dart';
import 'admin_log_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AdminMonitoringScreen(), // Dashboard Mahasiswa
    const ItemInputScreen(),       // Form Tambah Barang
    const AdminLogScreen(),        // Riwayat Global
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.red[900],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.monitor), label: 'Monitoring'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Add Item'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Logs'),
        ],
      ),
    );
  }
}