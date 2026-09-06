import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart' as db;
import '../../domain/entities/product.dart' as domain;
import '../models/product_model.dart';

class ProductLocalDataSource {
  final db.AppDatabase database;

  const ProductLocalDataSource(this.database);

  Future<ProductModel> createProduct(domain.Product product) async {
    final id = await database.into(database.products).insert(
          db.ProductsCompanion.insert(
            name: product.name,
            description: Value(product.description),
            categoryId: Value(product.categoryId),
            currentQuantity: product.currentQuantity,
            optimalQuantity: product.optimalQuantity,
            minimumQuantity: product.minimumQuantity,
            price: product.price,
            unit: product.unit,
            isActive: Value(product.isActive),
            createdAt: product.createdAt,
            updatedAt: product.updatedAt,
          ),
        );

    final createdProduct = await getProductById(id);

    if (createdProduct == null) {
      throw StateError('No se pudo recuperar el producto creado.');
    }

    return createdProduct;
  }

  Future<ProductModel?> getProductById(int id) async {
    final query = database.select(database.products)
      ..where((product) => product.id.equals(id));

    final result = await query.getSingleOrNull();

    if (result == null) {
      return null;
    }

    return _toModel(result);
  }

  Future<List<ProductModel>> getProducts() async {
    final results = await database.select(database.products).get();

    return results.map(_toModel).toList();
  }

  Future<ProductModel> updateProduct(domain.Product product) async {
    if (product.id == null) {
      throw ArgumentError(
        'No se puede actualizar un producto sin ID.',
      );
    }

    await database.update(database.products).replace(
          db.ProductsCompanion(
            id: Value(product.id!),
            name: Value(product.name),
            description: Value(product.description),
            categoryId: Value(product.categoryId),
            currentQuantity: Value(product.currentQuantity),
            optimalQuantity: Value(product.optimalQuantity),
            minimumQuantity: Value(product.minimumQuantity),
            price: Value(product.price),
            unit: Value(product.unit),
            isActive: Value(product.isActive),
            createdAt: Value(product.createdAt),
            updatedAt: Value(product.updatedAt),
          ),
        );

    final updatedProduct = await getProductById(product.id!);

    if (updatedProduct == null) {
      throw StateError('No se pudo recuperar el producto actualizado.');
    }

    return updatedProduct;
  }

  Future<void> deleteProduct(int id) async {
    await (database.delete(database.products)
          ..where((product) => product.id.equals(id)))
        .go();
  }

  ProductModel _toModel(db.Product row) {
    return ProductModel(
      id: row.id,
      name: row.name,
      description: row.description,
      categoryId: row.categoryId,
      currentQuantity: row.currentQuantity,
      optimalQuantity: row.optimalQuantity,
      minimumQuantity: row.minimumQuantity,
      price: row.price,
      unit: row.unit,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
}