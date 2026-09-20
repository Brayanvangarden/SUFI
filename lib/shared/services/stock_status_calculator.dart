import '../enums/stock_status.dart';

class StockStatusCalculator {
  const StockStatusCalculator();

  StockStatus calculate({
    required double currentQuantity,
    required double minimumQuantity,
    required double optimalQuantity,
  }) {
    if (currentQuantity <= 0) {
      return StockStatus.outOfStock;
    }

    if (currentQuantity < minimumQuantity) {
      return StockStatus.low;
    }

    return StockStatus.sufficient;
  }
}