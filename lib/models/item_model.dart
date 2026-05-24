class ItemModel {
  final String itemID;
  final String itemName;
  String itemStatus; // 'Available', 'Borrowed', 'InReparation'
  final String category;
  final String description; // Baru
  int quantity; // Baru

  ItemModel({
    required this.itemID,
    required this.itemName,
    required this.itemStatus,
    required this.category,
    this.description = '',
    this.quantity = 1,
  });
}