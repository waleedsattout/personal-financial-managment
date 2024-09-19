import 'package:finance_manager/models/expense.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mat;
import 'package:hive_flutter/hive_flutter.dart';

class RecurringTransactionScreen extends StatelessWidget {
  const RecurringTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Recurring Transactions'),
      ),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextBox(
              // decoration: const InputDecoration(
              //   labelText: 'Search Transactions',
              //   border: OutlineInputBorder(),
              // ),
              onChanged: (value) {
                // Handle search logic
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box<Expense>('transactions').listenable(),
              builder: (context, Box box, _) {
                if (box.values.isEmpty) {
                  return const Center(
                    child: Text('No recurring transactions found.'),
                  );
                }

                var recurringTransactions = box.values
                    .where((transaction) => transaction.isRecurring)
                    .toList();

                return ListView.builder(
                  itemCount: recurringTransactions.length,
                  itemBuilder: (context, index) {
                    final transaction = recurringTransactions[index];
                    return ListTile(
                      title: Text(transaction.name),
                      subtitle: Text(
                          'Amount: \$${transaction.amount} | Frequency: ${transaction.frequency} | Next Due: ${transaction.nextDueDate}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(mat.Icons.edit),
                            onPressed: () {
                              // Navigate to edit screen
                            },
                          ),
                          IconButton(
                            icon: const Icon(mat.Icons.delete),
                            onPressed: () {
                              // Delete transaction logic
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
