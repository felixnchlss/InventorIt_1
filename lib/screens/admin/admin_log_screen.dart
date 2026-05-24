import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class AdminLogScreen extends StatelessWidget {
  const AdminLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: globalLogs.length,
      itemBuilder: (context, index) {
        final log = globalLogs[index];
        bool isCheckIn = log['type'] == 'Check-In';

        return ListTile(
          leading: Icon(
            isCheckIn ? Icons.login : Icons.handyman,
            color: isCheckIn ? Colors.blue : Colors.orange,
          ),
          title: Text('${log['name']} - ${log['type']}'),
          subtitle: Text(log['detail']),
          trailing: Text(log['time'], style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          shape: const Border(bottom: BorderSide(color: Colors.black12, width: 1)),
        );
      },
    );
  }
}