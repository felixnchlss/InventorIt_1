import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void toggleCheckIn() {
    setState(() {
      isStudentCheckedIn = !isStudentCheckedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            const Text('Rehan Syahputra', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('NIM: 2802488990', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            Text('Role: Student', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isStudentCheckedIn ? Colors.green[100] : Colors.red[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(isStudentCheckedIn ? Icons.check_circle : Icons.cancel, 
                       color: isStudentCheckedIn ? Colors.green[800] : Colors.red[800]),
                  const SizedBox(width: 10),
                  Text(
                    isStudentCheckedIn ? 'Status: INSIDE LAB' : 'Status: OUTSIDE LAB',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      color: isStudentCheckedIn ? Colors.green[800] : Colors.red[800]
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleCheckIn,
              style: ElevatedButton.styleFrom(
                backgroundColor: isStudentCheckedIn ? Colors.redAccent : Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(isStudentCheckedIn ? 'Check Out Lab' : 'Check In Lab'),
            )
          ],
        ),
      ),
    );
  }
}