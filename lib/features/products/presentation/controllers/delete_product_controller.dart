import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/core_providers.dart';

final deleteProductControllerProvider =
    AsyncNotifierProvider<DeleteProductController, void>(
  DeleteProductController.new,
);

class DeleteProductController
    extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<bool> deleteProduct(int productId) async {
    state = const AsyncLoading();

    final result = await AsyncValue.guard(
      () => ref.read(deleteProductProvider).call(productId),
    );

    state = result;

    return result.hasValue;
  }
}