import '../models/item_model.dart';

// --- DATABASE SEMENTARA (GLOBAL STATE) ---

// 1. Data Barang Lab
List<ItemModel> labItems = [
  ItemModel(itemID: 'SD01', itemName: 'Solder 40W', itemStatus: 'Available', category: 'Soldering Gear', description: 'Solder standar untuk komponen kecil.', quantity: 5),
  ItemModel(itemID: 'MT01', itemName: 'Multimeter Digital', itemStatus: 'Borrowed', category: 'Power/Measurement', description: 'Alat ukur tegangan dan arus listrik.', quantity: 2),
  ItemModel(itemID: 'PL01', itemName: 'Tang Potong', itemStatus: 'Available', category: 'Hand Tools', description: 'Tang potong kabel presisi.', quantity: 10),
];

// 2. Data Status Mahasiswa Login (Untuk Profile)
bool isStudentCheckedIn = false;

// 3. Data Mahasiswa yang Sedang di Lab (Untuk Admin Monitoring)
List<Map<String, dynamic>> studentsInLab = [
  {'name': 'Andi Pratama', 'nim': '2802410001', 'timeIn': '08:30 AM', 'purpose': 'Prototyping'},
  {'name': 'Siti Aminah', 'nim': '2802410002', 'timeIn': '09:15 AM', 'purpose': 'Research'},
  {'name': 'Budi Santoso', 'nim': '2802410003', 'timeIn': '10:00 AM', 'purpose': 'Coursework'},
];

// 4. Data Semua Log Peminjaman & Check-In (Untuk Admin Logs)
List<Map<String, dynamic>> globalLogs = [
  {'type': 'Check-In', 'name': 'Andi Pratama', 'time': '08:30 AM', 'detail': 'Masuk lab untuk Prototyping'},
  {'type': 'Borrow', 'name': 'Andi Pratama', 'time': '08:45 AM', 'detail': 'Meminjam Multimeter Digital (MT01)'},
  {'type': 'Check-In', 'name': 'Siti Aminah', 'time': '09:15 AM', 'detail': 'Masuk lab untuk Research'},
];