import 'package:flutter/material.dart';
import '../../data/dummy_data.dart'; // Import dummy data

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  
  // Fungsi untuk meminjam barang secara lokal
  void borrowItem(int index) {
    setState(() {
      labItems[index].itemStatus = 'Borrowed';
      // UI akan langsung ter-update begitu tombol ditekan
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${labItems[index].itemName} berhasil dipinjam!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab Inventory"),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: labItems.length,
        itemBuilder: (context, index) {
          final item = labItems[index];
          bool isAvailable = item.itemStatus == 'Available';

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blueGrey[100],
                        child: Icon(
                          _getIconForCategory(item.category),
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.itemName,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(item.category, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                            Text('ID: ${item.itemID}', style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getStatusColor(item.itemStatus).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.itemStatus,
                          style: TextStyle(
                            color: _getStatusColor(item.itemStatus),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      // Jika isAvailable true, jalankan fungsi borrowItem. Jika false, tombol mati (null).
                      onPressed: isAvailable ? () => borrowItem(index) : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isAvailable ? Colors.blueAccent : Colors.grey.shade400,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(isAvailable ? 'Borrow Item' : 'Currently Unavailable'),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Fungsi estetika untuk Ikon
  IconData _getIconForCategory(String category) {
    if (category.contains("Soldering")) return Icons.hardware;
    if (category.contains("Power") || category.contains("Measurement")) return Icons.electric_meter;
    if (category.contains("Hand Tools")) return Icons.build;
    return Icons.inventory_2;
  }

  // Fungsi estetika untuk warna badge status
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Available': return Colors.green.shade800;
      case 'Borrowed': return Colors.orange.shade800;
      case 'InReparation': return Colors.red.shade800;
      default: return Colors.grey.shade800;
    }
  }
}