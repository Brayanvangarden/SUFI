import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/core_providers.dart';
import '../../domain/entities/product.dart';

final productControllerProvider =
    AsyncNotifierProvider<ProductController, List<Product>>(
  ProductController.new,
);

class ProductController extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() {
    return ref.read(getProductsProvider).call();
  }

  Future<void> loadProducts() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => ref.read(getProductsProvider).call(),
    );
  }
}