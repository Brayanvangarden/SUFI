import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    super.id,
    required super.name,
    super.description,
    super.categoryId,
    required super.currentQuantity,
    required super.optimalQuantity,
    required super.minimumQuantity,
    required super.price,
    required super.unit,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      categoryId: product.categoryId,
      currentQuantity: product.currentQuantity,
      optimalQuantity: product.optimalQuantity,
      minimumQuantity: product.minimumQuantity,
      price: product.price,
      unit: product.unit,
      isActive: product.isActive,
      createdAt: product.createdAt,
      updatedAt: product.updatedAt,
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      description: description,
      categoryId: categoryId,
      currentQuantity: currentQuantity,
      optimalQuantity: optimalQuantity,
      minimumQuantity: minimumQuantity,
      price: price,
      unit: unit,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}