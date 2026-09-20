import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/core_providers.dart';
import '../../domain/entities/product.dart';

final createProductControllerProvider =
    AsyncNotifierProvider<CreateProductController, Product?>(
      CreateProductController.new,
    );

class CreateProductController extends AsyncNotifier<Product?> {
  @override
  Future<Product?> build() async {
    return null;
  }

  Future<Product?> createProduct({
    required String name,
    String? description,
    int? categoryId,
    required double currentQuantity,
    required double optimalQuantity,
    required double minimumQuantity,
    required int price,
    required String unit,
  }) async {
    state = const AsyncLoading();

    final now = DateTime.now();

    final product = Product(
      name: name,
      description: description,
      categoryId: categoryId,
      currentQuantity: currentQuantity,
      optimalQuantity: optimalQuantity,
      minimumQuantity: minimumQuantity,
      price: price,
      unit: unit,
      isActive: true,
      createdAt: now,
      updatedAt: now,
    );

    final result = await AsyncValue.guard(
      () => ref.read(createProductProvider).call(product),
    );

    state = result;

    return result.when(
      data: (product) => product,
      loading: () => null,
      error: (_,_) => null,
    );
  }
}
