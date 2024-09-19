import 'package:finance_manager/models/expense.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Future<Box<Expense>> openBox() async {
    await Hive.initFlutter();
    if (Hive.isBoxOpen("expenses")) {
      return Hive.box<Expense>("expenses");
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ExpenseAdapter());
    }
    return await Hive.openBox<Expense>('expenses');
  }

  void addExpense(Expense expense) async {
    var box = Hive.box<Expense>("expenses");
    await box.add(expense);
  }

  void editExpense(int key, Expense expense) async {
    var box = Hive.box<Expense>("expenses");
    await box.put(key, expense);
  }

  Future<void> deleteExpense(int key) async {
    var box = Hive.box<Expense>("expenses");
    await box.delete(key);
  }

  Future<double> calculateBudget() async {
    var box = await openBox();
    var sum = 0.0;
    for (var e in box.values) {
      if (e.transactionType == "Expense") {
        sum -= e.amount;
      } else {
        sum += e.amount;
      }
    }
    return sum;
  }
}
