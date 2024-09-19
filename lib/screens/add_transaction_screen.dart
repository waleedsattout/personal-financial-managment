import 'package:finance_manager/models/expense.dart';
import 'package:finance_manager/providers/theme_provider.dart';
import 'package:finance_manager/services/hive_service.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class AddTransactionScreen extends StatefulWidget {
  final bool? withHeader;
  final Expense? expense;
  const AddTransactionScreen({super.key, this.withHeader, this.expense});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  String _transactionType = 'Income';
  String _selectedCategory = "Salary";
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late ThemeProvider themeProvider;
  List<String> _categories = [];

  final List<String> _incomeTransactionTypes = [
    "Salary",
    "Bonus",
    "Interest",
    "Dividend",
    "Rental Income",
    "Reimbursement",
    "Gift",
    "Inheritance",
    "Settlement",
    "Other Income",
  ];

  final List<String> _expenseTransactionTypes = [
    "Groceries",
    "Dining Out",
    "Utilities",
    "Rent",
    "Mortgage",
    "Transportation",
    "Fuel",
    "Shopping",
    "Entertainment",
    "Medical",
  ];

  @override
  void initState() {
    _categories = _incomeTransactionTypes;
    super.initState();
    if (widget.expense != null) {
      _transactionType = widget.expense!.transactionType;
      _selectedCategory = widget.expense!.category;
      _selectedDate = widget.expense!.date;
      _amountController.text = widget.expense!.amount.toString();
      _descriptionController.text = widget.expense!.description ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    var content = SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        "assets/vault.png"),
                  ),
                ),
                InfoLabel(
                  label: ('Amount'),
                  child: TextFormBox(
                    placeholder: 'Enter amount',
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('Transaction Type:'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioButton(
                          content: const Text('Income'),
                          checked: _transactionType == 'Income',
                          onChanged: (value) {
                            setState(() {
                              _transactionType = 'Income';
                              _categories = _incomeTransactionTypes;
                              _selectedCategory = "";
                            });
                          },
                        ),
                        const SizedBox(height: 8),
                        RadioButton(
                          content: const Text('Expense'),
                          checked: _transactionType == 'Expense',
                          onChanged: (value) {
                            setState(() {
                              _transactionType = 'Expense';
                              _categories = _expenseTransactionTypes;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ComboBox<String>(
                      placeholder: const Text('Category'),
                      items: _categories
                          .map((category) => ComboBoxItem(
                                value: category,
                                child: Text(category),
                              ))
                          .toList(),
                      value: _selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
                const SizedBox(height: 16),
                DatePicker(
                  header: ('Date of the transaction'),
                  startDate: DateTime(DateTime.now().year - 5),
                  endDate: DateTime.now(),
                  selected: _selectedDate,
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                InfoLabel(
                  label: ('Description (Optional)'),
                  child: TextFormBox(
                    placeholder: 'Enter description',
                    controller: _descriptionController,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  child: const Text('Save Transaction'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveTransaction();
                    }
                  },
                ),
              ],
            )));

    if (widget.expense != null) return content;

    return widget.withHeader == true
        ? NavigationView(
            appBar: const NavigationAppBar(
              title: Text('Add Transaction'),
            ),
            content: ScaffoldPage.withPadding(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 24,
                right: 16,
                left: 16,
              ),
              content: content,
            ))
        : ScaffoldPage.withPadding(
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 24,
              right: 16,
              left: 16,
            ),
            content: content);
  }

  void _saveTransaction() {
    if (double.tryParse(_amountController.text) == null) {
      displayInfoBar(context, builder: (context, close) {
        return InfoBar(
          title: const Text('Error'),
          content: const Text('You should type a valid amount.'),
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
          severity: InfoBarSeverity.error,
        );
      });
      return;
    }
    if(_selectedCategory == ""){
      displayInfoBar(context, builder: (context, close) {
        return InfoBar(
          title: const Text('Error'),
          content: const Text('You should select a category.'),
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
          severity: InfoBarSeverity.error,
        );
      });
      return;
    }
    if (_formKey.currentState!.validate()) {
      final newExpense = Expense(
        transactionType: _transactionType,
        category: _selectedCategory,
        amount: double.parse(_amountController.text),
        date: _selectedDate,
        description: _descriptionController.text,
      );

      var text = "added";
      // Call the HiveService to add the expense
      if (widget.expense != null) {
        text = "edited";
        HiveService().editExpense(widget.expense!.key, newExpense);
      } else {
        HiveService().addExpense(newExpense);
        // Optionally, you can clear the form after saving
        _amountController.clear();
        _descriptionController.clear();
        setState(() {
          _transactionType = 'Income';
          _selectedCategory = "Salary";
          _selectedDate = DateTime.now();
        });
      }

      // Show a success message (you can use a Fluent UI notification here)
      displayInfoBar(context, builder: (context, close) {
        return InfoBar(
          title: const Text('Done'),
          content: Text('Transaction $text successfully.'),
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
          severity: InfoBarSeverity.success,
        );
      });
    }
  }
}
