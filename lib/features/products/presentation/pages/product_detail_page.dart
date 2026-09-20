import 'package:flutter/material.dart';

import 'edit_product_page.dart';
import '../../../../app/theme/app_dimensions.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../shared/enums/stock_status.dart';
import '../../../../shared/services/stock_status_calculator.dart';
import '../../domain/entities/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final status = const StockStatusCalculator().calculate(
      currentQuantity: product.currentQuantity,
      minimumQuantity: product.minimumQuantity,
      optimalQuantity: product.optimalQuantity,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del producto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: AppTextStyles.title),

            const SizedBox(height: AppDimensions.spacingSm),

            if (product.description != null &&
                product.description!.trim().isNotEmpty)
              Text(product.description!, style: AppTextStyles.bodySecondary),

            const SizedBox(height: AppDimensions.spacingLg),

            _InfoCard(
              title: 'Inventario',
              children: [
                _InfoRow(
                  label: 'Cantidad actual',
                  value: '${product.currentQuantity} ${product.unit}',
                ),
                _InfoRow(
                  label: 'Cantidad mínima',
                  value: '${product.minimumQuantity} ${product.unit}',
                ),
                _InfoRow(
                  label: 'Cantidad óptima',
                  value: '${product.optimalQuantity} ${product.unit}',
                ),
              ],
            ),

            const SizedBox(height: AppDimensions.spacingMd),

            _InfoCard(
              title: 'Estado',
              children: [
                Row(
                  children: [
                    _StockIndicator(status: status),
                    const SizedBox(width: AppDimensions.spacingSm),
                    Text(_statusText(status), style: AppTextStyles.heading),
                  ],
                ),
              ],
            ),

            const SizedBox(height: AppDimensions.spacingMd),

            _InfoCard(
              title: 'Precio',
              children: [
                _InfoRow(
                  label: 'Precio por ${product.unit}',
                  value: '₡${product.price}',
                ),
              ],
            ),

            const SizedBox(height: AppDimensions.spacingLg),

            SizedBox(
              width: double.infinity,
              height: AppDimensions.buttonHeight,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EditProductPage(productId: product.id!),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Editar producto'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _statusText(StockStatus status) {
    return switch (status) {
      StockStatus.sufficient => 'Suficiente',
      StockStatus.low => 'Cantidad baja',
      StockStatus.outOfStock => 'Agotado',
    };
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _InfoCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.heading),
            const SizedBox(height: AppDimensions.spacingMd),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: Row(
        children: [
          Expanded(child: Text(label, style: AppTextStyles.bodySecondary)),
          Text(value, style: AppTextStyles.label),
        ],
      ),
    );
  }
}

class _StockIndicator extends StatelessWidget {
  final StockStatus status;

  const _StockIndicator({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      StockStatus.sufficient => Theme.of(context).colorScheme.primary,
      StockStatus.low => Colors.orange,
      StockStatus.outOfStock => Colors.red,
    };

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
