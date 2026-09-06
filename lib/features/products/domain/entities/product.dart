class Product {
  final int? id;
  final String name;
  final String? description;
  final int? categoryId;
  final double currentQuantity;
  final double optimalQuantity;
  final double minimumQuantity;
  final int price;
  final String unit;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    this.id,
    required this.name,
    this.description,
    this.categoryId,
    required this.currentQuantity,
    required this.optimalQuantity,
    required this.minimumQuantity,
    required this.price,
    required this.unit,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}