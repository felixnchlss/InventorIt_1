import 'package:flutter/material.dart';
import '../../models/item_model.dart';
import '../../data/dummy_data.dart';

class ItemInputScreen extends StatefulWidget {
  const ItemInputScreen({super.key});

  @override
  State<ItemInputScreen> createState() => _ItemInputScreenState();
}

class _ItemInputScreenState extends State<ItemInputScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _qtyController = TextEditingController();

  void saveItem() {
    if (_nameController.text.isNotEmpty && _qtyController.text.isNotEmpty) {
      setState(() {
        labItems.add(ItemModel(
          itemID: 'NEW${labItems.length + 1}', // ID Otomatis
          itemName: _nameController.text,
          itemStatus: 'Available',
          category: 'Uncategorized',
          description: _descController.text,
          quantity: int.tryParse(_qtyController.text) ?? 1,
        ));
      });
      
      _nameController.clear();
      _descController.clear();
      _qtyController.clear();
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Barang berhasil ditambahkan!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder untuk Foto
          Center(
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                // PERBAIKAN: Dibuat solid secara default dengan menghapus BorderStyle.dash
                border: Border.all(color: Colors.grey), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo, size: 50, color: Colors.grey[600]),
                  const SizedBox(height: 8),
                  Text('Tap to add photo', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nama Alat', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descController,
            maxLines: 3,
            decoration: const InputDecoration(labelText: 'Deskripsi Alat', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _qtyController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Jumlah Alat (Stok)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: saveItem,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[900],
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Simpan Barang ke Database'),
          )
        ],
      ),
    );
  }
}