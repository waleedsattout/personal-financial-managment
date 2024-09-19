import 'package:finance_manager/providers/theme_provider.dart';
import 'package:finance_manager/screens/add_transaction_screen.dart';
import 'package:finance_manager/services/hive_service.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:finance_manager/models/expense.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionDetailScreen extends StatelessWidget {
  final Expense transaction;

  const TransactionDetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        _buildDetailRow('Amount', '\$${transaction.amount}'),
        const SizedBox(height: 16),
        _buildDetailRow('Transaction Type', transaction.transactionType),
        const SizedBox(height: 16),
        _buildDetailRow('Category', transaction.category),
        const SizedBox(height: 16),
        _buildDetailRow('Date', DateFormat("y-M-d").format(transaction.date)),
        const SizedBox(height: 16),
        _buildDetailRow(
            'Description',
            transaction.description!.isEmpty
                ? 'No description provided'
                : transaction.description),
        const SizedBox(height: 24),
        // Add additional info or actions if needed
      ],
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(value ?? ""),
        ),
      ],
    );
  }
}

void showContentDialog(BuildContext context, Expense item) async {
  var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

  showDialog<String>(
    context: context,
    barrierDismissible: true,
    dismissWithEsc: true,
    builder: (context) => ContentDialog(
      title: const Text('Transaction Details'),
      content: TransactionDetailScreen(
        transaction: item,
      ),
      actions: [
        Button(
          child: const Text('Edit'),
          onPressed: () async {
            showDialog(
              barrierDismissible: true,
              dismissWithEsc: true,
              context: context,
              builder: (context) {
                return ContentDialog(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Edit Transaction"),
                      Row(
                        children: [
                          IconButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    WidgetStateProperty.resolveWith((states) {
                                  return themeProvider.primaryTheme.error;
                                }),
                              ),
                              icon: const Icon(FluentIcons.delete,
                                  fill: 1, size: 24.0),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (builder) => ContentDialog(
                                          title:
                                              const Text('Delete Transaction'),
                                          content: const Text(
                                              'Are you sure you want to delete this transaction?'),
                                          actions: [
                                            Button(
                                              child: const Text('Delete'),
                                              onPressed: () async {
                                                await HiveService()
                                                    .deleteExpense(item.key);
                                                if (context.mounted) {
                                                  displayInfoBar(context,
                                                      builder:
                                                          (context, close) {
                                                    return InfoBar(
                                                      title:
                                                          const Text('Deleted'),
                                                      content: const Text(
                                                          'Expense was deleted successfully.'),
                                                      action: IconButton(
                                                        icon: const Icon(
                                                            FluentIcons.clear),
                                                        onPressed: close,
                                                      ),
                                                      severity: InfoBarSeverity
                                                          .success,
                                                    );
                                                  });
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                            FilledButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ));
                              }),
                          IconButton(
                              icon: const Icon(FluentIcons.chrome_close,
                                  size: 24.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }),
                        ],
                      )
                    ],
                  ),
                  content: AddTransactionScreen(
                    expense: item,
                  ),
                );
              },
            );
            // Navigator.pop(context, 'User deleted file');
          },
        ),
        FilledButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, 'User canceled dialog'),
        ),
      ],
    ),
  );
}
