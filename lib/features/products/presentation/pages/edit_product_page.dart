import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product.dart';
import '../controllers/product_controller.dart';
import '../controllers/update_product_controller.dart';
import '../widgets/product_form.dart';
import 'package:go_router/go_router.dart';

class EditProductPage extends ConsumerWidget {
  final int productId;

  const EditProductPage({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
  updateProductControllerProvider,
  (previous, next) {
    next.whenOrNull(
      data: (product) {
        if (product == null) {
          return;
        }

        ref.invalidate(productControllerProvider);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Producto actualizado correctamente.',
              ),
            ),
          );

          context.pop();
        }
      },
      error: (error, stackTrace) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'No se pudo actualizar el producto.',
              ),
            ),
          );
        }
      },
    );
  },
);
    final productsState = ref.watch(productControllerProvider);

    return productsState.when(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => const Scaffold(
        body: Center(
          child: Text(
            'No se pudo cargar el producto.',
          ),
        ),
      ),
      data: (products) {
        Product? product;

        for (final item in products) {
          if (item.id == productId) {
            product = item;
            break;
          }
        }

        if (product == null) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Producto no encontrado.',
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Editar producto'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ProductForm(
              initialName: product.name,
              initialDescription: product.description,
              initialCurrentQuantity:
                  product.currentQuantity,
              initialOptimalQuantity:
                  product.optimalQuantity,
              initialMinimumQuantity:
                  product.minimumQuantity,
              initialPrice: product.price,
              initialUnit: product.unit,
              onSubmit: ({
                required name,
                description,
                required currentQuantity,
                required optimalQuantity,
                required minimumQuantity,
                required price,
                required unit,
              }) async {
                await ref
                    .read(
                      updateProductControllerProvider
                          .notifier,
                    )
                    .updateProduct(
                      product: product!.copyWith(
                        name: name,
                        description: description,
                        currentQuantity: currentQuantity,
                        optimalQuantity: optimalQuantity,
                        minimumQuantity: minimumQuantity,
                        price: price,
                        unit: unit,
                      ),
                    );
              },
            ),
          ),
        );
      },
    );
  }
}