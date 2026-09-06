import '../entities/product.dart';
import '../repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository repository;

  const UpdateProduct(this.repository);

  Future<Product> call(Product product) {
    return repository.updateProduct(product);
  }
}