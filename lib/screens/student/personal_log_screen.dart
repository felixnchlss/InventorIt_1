import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';

class PersonalLogScreen extends StatefulWidget {
  const PersonalLogScreen({super.key});

  @override
  State<PersonalLogScreen> createState() => _PersonalLogScreenState();
}

class _PersonalLogScreenState extends State<PersonalLogScreen> {
  // Fungsi mengembalikan barang
  void returnItem(int globalIndex) {
    setState(() {
      labItems[globalIndex].itemStatus = 'Available';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Alat berhasil dikembalikan!'), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Memfilter barang yang statusnya "Borrowed"
    List<int> borrowedIndices = [];
    for (int i = 0; i < labItems.length; i++) {
      if (labItems[i].itemStatus == 'Borrowed') {
        borrowedIndices.add(i);
      }
    }

    if (borrowedIndices.isEmpty) {
      return const Center(child: Text('Anda belum meminjam alat apapun.'));
    }

    return ListView.builder(
      itemCount: borrowedIndices.length,
      itemBuilder: (context, index) {
        int globalIndex = borrowedIndices[index];
        final item = labItems[globalIndex];

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.handyman)),
            title: Text(item.itemName, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('ID: ${item.itemID}\nHarap kembalikan dalam kondisi baik.'),
            trailing: ElevatedButton(
              onPressed: () => returnItem(globalIndex),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              child: const Text('Return'),
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}