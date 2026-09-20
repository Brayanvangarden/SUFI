import 'package:flutter/material.dart';

import '../../../../app/theme/app_dimensions.dart';
import '../../../../app/theme/app_text_styles.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sufi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          AppDimensions.spacingMd,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hola 👋',
              style: AppTextStyles.title,
            ),
            const SizedBox(
              height: AppDimensions.spacingSm,
            ),
            const Text(
              'Este es el estado de tu hogar.',
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(
              height: AppDimensions.spacingLg,
            ),
            Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    title: 'Productos',
                    value: '0',
                    icon: Icons.inventory_2_outlined,
                  ),
                ),
                const SizedBox(
                  width: AppDimensions.spacingMd,
                ),
                Expanded(
                  child: _SummaryCard(
                    title: 'Stock bajo',
                    value: '0',
                    icon: Icons.warning_amber_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppDimensions.spacingLg,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(
                  AppDimensions.spacingMd,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Theme.of(context)
                          .colorScheme
                          .primary,
                      size: 32,
                    ),
                    const SizedBox(
                      width: AppDimensions.spacingMd,
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Todo en orden',
                            style: AppTextStyles.heading,
                          ),
                          SizedBox(
                            height: AppDimensions.spacingXs,
                          ),
                          Text(
                            'Aún no tienes productos registrados.',
                            style:
                                AppTextStyles.bodySecondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
          AppDimensions.spacingMd,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: AppDimensions.spacingSm,
            ),
            Text(
              value,
              style: AppTextStyles.title,
            ),
            const SizedBox(
              height: AppDimensions.spacingXs,
            ),
            Text(
              title,
              style: AppTextStyles.bodySecondary,
            ),
          ],
        ),
      ),
    );
  }
}