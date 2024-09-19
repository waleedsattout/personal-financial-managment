import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 1)
class Expense extends HiveObject {
  @HiveField(0)
  final String transactionType;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String? description;

  @HiveField(5)
  final bool isRecurring;

  Expense({
    required this.transactionType,
    required this.category,
    required this.amount,
    required this.date,
    this.description,
    this.isRecurring = false
  });
}
