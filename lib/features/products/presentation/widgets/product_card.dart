import 'package:flutter/material.dart';

import '../../../../app/theme/app_dimensions.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../shared/enums/stock_status.dart';
import '../../../../shared/services/stock_status_calculator.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final status = const StockStatusCalculator().calculate(
      currentQuantity: product.currentQuantity,
      minimumQuantity: product.minimumQuantity,
      optimalQuantity: product.optimalQuantity,
    );

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusMd,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            AppDimensions.spacingMd,
          ),
          child: Row(
            children: [
              _StockIndicator(status: status),
              const SizedBox(
                width: AppDimensions.spacingMd,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: AppTextStyles.heading,
                    ),
                    const SizedBox(
                      height: AppDimensions.spacingXs,
                    ),
                    Text(
                      '${product.currentQuantity} ${product.unit}',
                      style: AppTextStyles.bodySecondary,
                    ),
                    const SizedBox(
                      height: AppDimensions.spacingXs,
                    ),
                    Text(
                      'Óptimo: ${product.optimalQuantity} ${product.unit}',
                      style: AppTextStyles.bodySecondary,
                    ),
                  ],
                ),
              ),
              Text(
                '₡${product.price}',
                style: AppTextStyles.label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StockIndicator extends StatelessWidget {
  final StockStatus status;

  const _StockIndicator({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      StockStatus.sufficient =>
        Theme.of(context).colorScheme.primary,
      StockStatus.low => Colors.orange,
      StockStatus.outOfStock => Colors.red,
    };

    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}