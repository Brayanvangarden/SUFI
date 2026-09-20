import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controllers/delete_product_controller.dart';
import '../controllers/product_controller.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    int productId,
    String productName,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Eliminar producto'),
          content: Text('¿Está seguro de que desea eliminar "$productName"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    final success = await ref
        .read(deleteProductControllerProvider.notifier)
        .deleteProduct(productId);

    if (!context.mounted) {
      return;
    }

    if (success) {
      ref.invalidate(productControllerProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto eliminado correctamente.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo eliminar el producto.')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: productsState.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text('No se pudieron cargar los productos.'),
          );
        },
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

              return ProductCard(
                product: product,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(product: product),
                    ),
                  );
                },
                onDelete: () {
                  _confirmDelete(context, ref, product.id!, product.name);
                },
              );
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
