import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class AdminMonitoringScreen extends StatelessWidget {
  const AdminMonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Mahasiswa di Lab (Real-time)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: studentsInLab.length,
            itemBuilder: (context, index) {
              final student = studentsInLab[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.red[100],
                    child: Icon(Icons.person, color: Colors.red[900]),
                  ),
                  title: Text(student['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('NIM: ${student['nim']}\nTujuan: ${student['purpose']}'),
                  trailing: Text('In: ${student['timeIn']}', style: TextStyle(color: Colors.grey[600])),
                  isThreeLine: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}