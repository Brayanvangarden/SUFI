import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateProduct {
  final ProductRepository repository;

  const CreateProduct(this.repository);

  Future<Product> call(Product product) {
    return repository.createProduct(product);
  }
}