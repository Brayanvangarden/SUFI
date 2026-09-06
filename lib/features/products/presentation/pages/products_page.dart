import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sufi/features/products/presentation/widgets/product_card.dart';

import '../controllers/product_controller.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: productsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text(
            'No se pudieron cargar los productos.',
            textAlign: TextAlign.center,
          ),
        ),
        data: (products) {
          if (products.isEmpty) {
            return const Center(child: Text('No hay productos registrados.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 8);
            },
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCard(product: product);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/products/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
