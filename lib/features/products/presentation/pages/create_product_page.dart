import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sufi/features/products/presentation/controllers/product_controller.dart';
import '../../../../core/providers/core_providers.dart';
import '../controllers/create_product_controller.dart';
import '../widgets/product_form.dart';

class CreateProductPage extends ConsumerWidget {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      createProductControllerProvider,
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
                    'Producto creado correctamente.',
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
                    'No se pudo crear el producto.',
                  ),
                ),
              );
            }
          },
        );
      },
    );

    final state = ref.watch(
      createProductControllerProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo producto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ProductForm(
          onSubmit: ({
            required name,
            description,
            required currentQuantity,
            required optimalQuantity,
            required minimumQuantity,
            required price,
            required unit,
          }) {
            return ref
                .read(createProductControllerProvider.notifier)
                .createProduct(
                  name: name,
                  description: description,
                  currentQuantity: currentQuantity,
                  optimalQuantity: optimalQuantity,
                  minimumQuantity: minimumQuantity,
                  price: price,
                  unit: unit,
                );
          },
        ),
      ),
      floatingActionButton: state.isLoading
          ? const FloatingActionButton(
              onPressed: null,
              child: CircularProgressIndicator(),
            )
          : null,
    );
  }
}