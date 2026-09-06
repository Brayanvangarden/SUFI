import '../entities/product.dart';

abstract class ProductRepository {
  Future<Product> createProduct(Product product);

  Future<Product?> getProductById(int id);

  Future<List<Product>> getProducts();

  Future<Product> updateProduct(Product product);

  Future<void> deleteProduct(int id);
}