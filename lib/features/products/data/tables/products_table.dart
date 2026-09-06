import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  TextColumn get description => text().nullable()();

  IntColumn get categoryId => integer().nullable()();

  RealColumn get currentQuantity => real()();

  RealColumn get optimalQuantity => real()();

  RealColumn get minimumQuantity => real()();

  IntColumn get price => integer()();

  TextColumn get unit => text().withLength(min: 1, max: 30)();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}