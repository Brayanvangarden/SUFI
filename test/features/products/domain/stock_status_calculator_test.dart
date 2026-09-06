import 'package:flutter_test/flutter_test.dart';

import 'package:sufi/shared/enums/stock_status.dart';
import 'package:sufi/shared/services/stock_status_calculator.dart';

void main() {
  group('StockStatusCalculator', () {
    const calculator = StockStatusCalculator();

    test('debe devolver outOfStock cuando la cantidad actual es 0', () {
      final result = calculator.calculate(
        currentQuantity: 0,
        minimumQuantity: 1,
        optimalQuantity: 5,
      );

      expect(result, StockStatus.outOfStock);
    });

    test('debe devolver low cuando está por debajo del mínimo', () {
      final result = calculator.calculate(
        currentQuantity: 0.5,
        minimumQuantity: 1,
        optimalQuantity: 5,
      );

      expect(result, StockStatus.low);
    });

    test('debe devolver sufficient cuando alcanza el mínimo', () {
      final result = calculator.calculate(
        currentQuantity: 1,
        minimumQuantity: 1,
        optimalQuantity: 5,
      );

      expect(result, StockStatus.sufficient);
    });

    test('debe devolver sufficient cuando supera el mínimo', () {
      final result = calculator.calculate(
        currentQuantity: 4,
        minimumQuantity: 1,
        optimalQuantity: 5,
      );

      expect(result, StockStatus.sufficient);
    });
  });
}