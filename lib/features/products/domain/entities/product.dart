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
  Product copyWith({
  int? id,
  String? name,
  String? description,
  int? categoryId,
  double? currentQuantity,
  double? optimalQuantity,
  double? minimumQuantity,
  int? price,
  String? unit,
  bool? isActive,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return Product(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    categoryId: categoryId ?? this.categoryId,
    currentQuantity:
        currentQuantity ?? this.currentQuantity,
    optimalQuantity:
        optimalQuantity ?? this.optimalQuantity,
    minimumQuantity:
        minimumQuantity ?? this.minimumQuantity,
    price: price ?? this.price,
    unit: unit ?? this.unit,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}
}