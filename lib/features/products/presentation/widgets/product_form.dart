import 'package:flutter/material.dart';

import '../../../../app/theme/app_dimensions.dart';

class ProductForm extends StatefulWidget {
  final Future<void> Function({
    required String name,
    String? description,
    required double currentQuantity,
    required double optimalQuantity,
    required double minimumQuantity,
    required int price,
    required String unit,
  })? onSubmit;

  const ProductForm({
    super.key,
    this.onSubmit,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _currentQuantityController = TextEditingController();
  final _optimalQuantityController = TextEditingController();
  final _minimumQuantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _unitController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _currentQuantityController.dispose();
    _optimalQuantityController.dispose();
    _minimumQuantityController.dispose();
    _priceController.dispose();
    _unitController.dispose();

    super.dispose();
  }

  Future<void> _submit() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  final currentQuantity =
      double.tryParse(_currentQuantityController.text.trim());

  final optimalQuantity =
      double.tryParse(_optimalQuantityController.text.trim());

  final minimumQuantity =
      double.tryParse(_minimumQuantityController.text.trim());

  final price =
      int.tryParse(_priceController.text.trim());

  if (currentQuantity == null ||
      optimalQuantity == null ||
      minimumQuantity == null ||
      price == null) {
    return;
  }

  await widget.onSubmit?.call(
    name: _nameController.text.trim(),
    description: _descriptionController.text.trim().isEmpty
        ? null
        : _descriptionController.text.trim(),
    currentQuantity: currentQuantity,
    optimalQuantity: optimalQuantity,
    minimumQuantity: minimumQuantity,
    price: price,
    unit: _unitController.text.trim(),
  );
}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nombre',
              hintText: 'Ej. Arroz',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Ingrese el nombre del producto.';
              }

              return null;
            },
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Descripción',
              hintText: 'Descripción opcional',
            ),
            maxLines: 2,
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          TextFormField(
            controller: _currentQuantityController,
            decoration: const InputDecoration(
              labelText: 'Cantidad actual',
              hintText: 'Ej. 2.5',
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          TextFormField(
            controller: _optimalQuantityController,
            decoration: const InputDecoration(
              labelText: 'Cantidad óptima',
              hintText: 'Ej. 5',
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          TextFormField(
            controller: _minimumQuantityController,
            decoration: const InputDecoration(
              labelText: 'Cantidad mínima',
              hintText: 'Ej. 1',
            ),
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          TextFormField(
            controller: _priceController,
            decoration: const InputDecoration(
              labelText: 'Precio',
              prefixText: '₡ ',
              hintText: 'Ej. 1500',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          TextFormField(
            controller: _unitController,
            decoration: const InputDecoration(
              labelText: 'Unidad',
              hintText: 'Ej. kg, L, unidades',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Ingrese la unidad.';
              }

              return null;
            },
          ),
          const SizedBox(height: AppDimensions.spacingLg),
          SizedBox(
            height: AppDimensions.buttonHeight,
            child: FilledButton(
              onPressed: _submit,
              child: const Text('Guardar producto'),
            ),
          ),
        ],
      ),
    );
  }
}