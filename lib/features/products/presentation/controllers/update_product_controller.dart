import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/core_providers.dart';
import '../../domain/entities/product.dart';

final updateProductControllerProvider =
    AsyncNotifierProvider<UpdateProductController, Product?>(
  UpdateProductController.new,
);

class UpdateProductController
    extends AsyncNotifier<Product?> {
  @override
  Future<Product?> build() async {
    return null;
  }

  Future<Product?> updateProduct({
    required Product product,
  }) async {
    state = const AsyncLoading();

    final updatedProduct = Product(
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
      updatedAt: DateTime.now(),
    );

    final result = await AsyncValue.guard(
      () => ref.read(updateProductProvider).call(
            updatedProduct,
          ),
    );

    state = result;

    return result.when(
      data: (product) => product,
      loading: () => null,
      error: (_, _) => null,
    );
  }
}