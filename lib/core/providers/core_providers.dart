import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../../features/products/data/datasources/product_local_datasource.dart';
import '../../features/products/data/repositories/product_repository_impl.dart';
import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/domain/usecases/create_product.dart';
import '../../features/products/domain/usecases/delete_product.dart';
import '../../features/products/domain/usecases/get_product.dart';
import '../../features/products/domain/usecases/get_products.dart';
import '../../features/products/domain/usecases/update_product.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();

  ref.onDispose(database.close);

  return database;
});

final productLocalDataSourceProvider = Provider<ProductLocalDataSource>((ref) {
  final database = ref.watch(appDatabaseProvider);

  return ProductLocalDataSource(database);
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final localDataSource = ref.watch(productLocalDataSourceProvider);

  return ProductRepositoryImpl(localDataSource);
});

final createProductProvider = Provider<CreateProduct>((ref) {
  return CreateProduct(
    ref.watch(productRepositoryProvider),
  );
});

final getProductProvider = Provider<GetProduct>((ref) {
  return GetProduct(
    ref.watch(productRepositoryProvider),
  );
});

final getProductsProvider = Provider<GetProducts>((ref) {
  return GetProducts(
    ref.watch(productRepositoryProvider),
  );
});

final updateProductProvider = Provider<UpdateProduct>((ref) {
  return UpdateProduct(
    ref.watch(productRepositoryProvider),
  );
});

final deleteProductProvider = Provider<DeleteProduct>((ref) {
  return DeleteProduct(
    ref.watch(productRepositoryProvider),
  );
});