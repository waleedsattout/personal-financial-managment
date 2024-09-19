import 'package:finance_manager/providers/theme_provider.dart';
import 'package:finance_manager/screens/transaction_details_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart'
    hide Colors, Card, FilledButton, ButtonStyle;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:finance_manager/models/expense.dart';
import 'package:finance_manager/services/hive_service.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  String _transactionType = 'All';
  DateTime? _startDate;
  DateTime? _endDate;
  Box<Expense>? _expenseBox;
  final List<String> _sortOptions = ['Date', 'Amount', 'Category'];
  bool _isAscending = true;
  String _sortBy = 'Date';

  final List<String> _categories = [
    'All',
    'Food',
    'Travel',
    'Shopping',
    'Salary'
  ];
  final List<String> _transactionTypes = ['All', 'Income', 'Expense'];
  late ThemeProvider themeProvider;

  @override
  void initState() {
    super.initState();
    HiveService().openBox().then((e) {
      _expenseBox = e;
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _expenseBox = await HiveService().openBox();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    if (_expenseBox == null) {
      return const Center(
        child: ProgressRing(),
      );
    } else {
      return ScaffoldPage.scrollable(
        resizeToAvoidBottomInset: true,
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 24,
          right: 16,
          left: 16,
        ),
        children: [
          Expander(
            leading: const Icon(FluentIcons.filter),
            header: const Text('Search & filter'),
            content: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextBox(
                  placeholder: 'Search by description or amount',
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  InfoLabel(
                    label: "Transaction Type",
                    child: ComboBox<String>(
                      placeholder: const Text('Transaction Type'),
                      value: _transactionType,
                      items: _transactionTypes
                          .map((type) => ComboBoxItem(
                                value: type,
                                child: Text(type),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _transactionType = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  InfoLabel(
                    label: "Category",
                    child: ComboBox<String>(
                      placeholder: const Text('Category'),
                      value: _selectedCategory,
                      items: _categories
                          .map((category) => ComboBoxItem(
                                value: category,
                                child: Text(category),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expander(
                header: const Text('Date filter'),
                content: Column(
                  children: [
                    DatePicker(
                      header: 'Start Date',
                      selected: _startDate,
                      onChanged: (value) {
                        setState(() {
                          _startDate = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    DatePicker(
                      header: 'End Date',
                      selected: _endDate,
                      onChanged: (value) {
                        setState(() {
                          _endDate = value;
                        });
                      },
                    ),
                  ],
                ),
                onStateChanged: (open) {},
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ComboBox<String>(
                    placeholder: const Text('Sort By'),
                    value: _sortBy,
                    items: _sortOptions
                        .map((option) => ComboBoxItem(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _sortBy = value!;
                      });
                    },
                  ),
                  ToggleButton(
                    style: ToggleButtonThemeData(
                        checkedButtonStyle: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                themeProvider.primaryTheme.secondaryContainer),
                            foregroundColor: WidgetStatePropertyAll(
                                themeProvider
                                    .primaryTheme.onSecondaryContainer))),
                    checked: _isAscending,
                    onChanged: (v) => setState(() => _isAscending = v),
                    child: Text(_isAscending ? 'Ascending' : 'Descending'),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                      child: const Text("Clear"),
                      onPressed: () {
                        setState(() {
                          _searchQuery = '';
                          _selectedCategory = 'All';
                          _transactionType = 'All';
                          _startDate = null;
                          _endDate = null;
                          _isAscending = true;
                          _sortBy = 'Date';
                        });
                      })
                ],
              ),
            ]),
          ),
          const SizedBox(height: 16),
          _expenseBox == null
              ? const ProgressRing()
              : ValueListenableBuilder(
                  valueListenable: _expenseBox!.listenable(),
                  builder: (context, Box<Expense> box, _) {
                    final transactions =
                        _applyFiltersAndSorting(box.values.toList());
                    return StaggeredGrid.count(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: transactions.map((e) => card(e)).toList());
                  },
                ),
        ],
      );
    }
  }

  Widget card(Expense item) {
    String amount = item.amount.toString();
    String category = item.category;
    String? description = item.description != null
        ? item.description!.isNotEmpty
            ? item.description
            : "No desciption provided"
        : "No desciption provided";
    DateTime date = item.date;
    String color = item.transactionType == "Income" ? "success" : "error";

    Color bgColor;
    Color fgColor;
    Color tintColor;

    switch (color) {
      case "error":
        bgColor = themeProvider.errorTheme.primary;
        tintColor = themeProvider.errorTheme.primaryContainer;
        fgColor = themeProvider.errorTheme.onPrimaryContainer;

      case "warning":
        bgColor = themeProvider.warningTheme.primary;
        tintColor = themeProvider.warningTheme.primaryContainer;
        fgColor = themeProvider.warningTheme.onPrimaryContainer;

      case "success":
      default:
        bgColor = themeProvider.successTheme.primary;
        tintColor = themeProvider.successTheme.primaryContainer;
        fgColor = themeProvider.successTheme.onPrimaryContainer;
        break;
    }

    return MaterialButton(
      color: tintColor,
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  height: MediaQuery.of(context).size.width / 5,
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                      color: tintColor.toAccentColor().lightest,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat("d").format(date),
                                style: TextStyle(
                                    fontSize: 22,
                                    color: bgColor.toAccentColor().dark),
                              ),
                              Text(
                                DateFormat("MMM").format(date),
                                style: TextStyle(
                                    color: bgColor.toAccentColor().dark),
                              ),
                            ],
                          ))),
                ),
              ),
              SizedBox.fromSize(
                size: const Size(16, 16),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 18,
                              color: fgColor,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: Text(
                                description!,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ))
                        ],
                      )),
                      Text(
                        "\$$amount",
                        style: TextStyle(color: fgColor, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        showContentDialog(context, item);
      },
    );
  }

// Filter, Search, and Sort Logic
  List<Expense> _applyFiltersAndSorting(List<Expense> transactions) {
    var filteredTransactions = transactions.where((transaction) {
      final matchesSearch = _searchQuery.isEmpty ||
          transaction.description!
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          transaction.amount.toString().contains(_searchQuery);

      final matchesCategory = _selectedCategory == 'All' ||
          transaction.category == _selectedCategory;
      final matchesType = _transactionType == 'All' ||
          transaction.transactionType == _transactionType;

      final matchesDate =
          (_startDate == null || transaction.date.isAfter(_startDate!)) &&
              (_endDate == null || transaction.date.isBefore(_endDate!));

      return matchesSearch && matchesCategory && matchesType && matchesDate;
    }).toList();

    // Sorting Logic
    filteredTransactions.sort((a, b) {
      int comparison = 0;
      switch (_sortBy) {
        case 'Date':
          comparison = a.date.compareTo(b.date);
          break;
        case 'Amount':
          comparison = a.amount.compareTo(b.amount);
          break;
        case 'Category':
          comparison = a.category.compareTo(b.category);
          break;
      }
      return _isAscending ? comparison : -comparison;
    });

    return filteredTransactions;
  }
}
