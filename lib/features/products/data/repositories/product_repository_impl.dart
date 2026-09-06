import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  const ProductRepositoryImpl(this.localDataSource);

  @override
  Future<Product> createProduct(Product product) {
    return localDataSource.createProduct(product);
  }

  @override
  Future<Product?> getProductById(int id) {
    return localDataSource.getProductById(id);
  }

  @override
  Future<List<Product>> getProducts() {
    return localDataSource.getProducts();
  }

  @override
  Future<Product> updateProduct(Product product) {
    return localDataSource.updateProduct(product);
  }

  @override
  Future<void> deleteProduct(int id) {
    return localDataSource.deleteProduct(id);
  }
}