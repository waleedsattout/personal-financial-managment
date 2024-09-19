import 'package:finance_manager/providers/theme_provider.dart';
import 'package:finance_manager/screens/transaction_details_screen.dart';
import 'package:finance_manager/widgets/chart.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:finance_manager/services/hive_service.dart';
import 'package:finance_manager/models/expense.dart';
import 'package:flutter/material.dart' hide ListTile;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  List<Expense> _transactions = [];
  List<Expense> expenses = [];
  List<Expense> incomes = [];
  List<Expense> transactionList = [];
  late HiveService _hiveService;
  double _totalIncome = 0;
  double _totalExpenses = 0;
  late ThemeProvider themeProvider;
  int touchedIndex = 0;

  @override
  void initState() {
    super.initState();
    _hiveService = HiveService();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    final transactions = (await _hiveService.openBox()).values.toList();
    setState(() {
      transactionList = () {
        transactions.sort((a, b) => -a.amount.compareTo(b.amount));
        return transactions;
      }()
          .take(10)
          .toList();

      _transactions = transactions;
      expenses = transactions.where((e) {
        return e.transactionType == "Expense";
      }).toList();

      incomes = transactions.where((e) {
        return e.transactionType == "Income";
      }).toList();

      _calculateTotals();
    });
  }

  void _calculateTotals() {
    _totalIncome = 0;
    _totalExpenses = 0;

    for (var transaction in _transactions) {
      if (transaction.transactionType == 'Income') {
        _totalIncome += transaction.amount;
      } else if (transaction.transactionType == 'Expense') {
        _totalExpenses += transaction.amount;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return ScaffoldPage.scrollable(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 24,
          right: 12,
          left: 12,
        ),
        children:
            // _transactions.isEmpty
            //     ? [const Center(child: ProgressRing())]
            //     :
            [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      "\$${_totalIncome - _totalExpenses}",
                      style: TextStyle(
                        color: (_totalIncome - _totalExpenses) > 0
                            ? themeProvider.primaryTheme.primary
                            : themeProvider.errorTheme.error,
                        fontFamily: GoogleFonts.playfair().fontFamily,
                        fontSize: MediaQuery.of(context).size.width / 6,
                      ),
                    ),
                    Text(
                      "Total",
                      style: TextStyle(
                        color: (_totalIncome - _totalExpenses) > 0
                            ? themeProvider.primaryTheme.primary
                            : themeProvider.errorTheme.error,
                        fontFamily: GoogleFonts.playfair().fontFamily,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: themeProvider.successTheme.primaryContainer),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          '\$$_totalIncome',
                          style: TextStyle(
                              fontFamily: GoogleFonts.playfair().fontFamily,
                              color:
                                  themeProvider.successTheme.onPrimaryContainer,
                              fontSize: MediaQuery.of(context).size.width / 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Income',
                          style: TextStyle(
                              color:
                                  themeProvider.successTheme.onPrimaryContainer,
                              fontFamily: GoogleFonts.playfair().fontFamily,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: themeProvider.errorTheme.primaryContainer),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          '\$$_totalExpenses',
                          style: TextStyle(
                              color:
                                  themeProvider.errorTheme.onPrimaryContainer,
                              fontFamily: GoogleFonts.playfair().fontFamily,
                              fontSize: MediaQuery.of(context).size.width / 12,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Expenses',
                          style: TextStyle(
                              fontFamily: GoogleFonts.playfair().fontFamily,
                              color:
                                  themeProvider.errorTheme.onPrimaryContainer,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ExpenseIncomeChartSwitcher(
            expenses: expenses,
            incomes: incomes,
            isYearly: true,
          ),
          const SizedBox(
            width: 16,
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Top Transactions",
              style: TextStyle(
                  fontFamily: GoogleFonts.playfair().fontFamily, fontSize: 20),
            ),
          ),
          StaggeredGrid.count(
            crossAxisCount: 2,
            children: [
              for (var i in transactionList)
                ListTile(
                  trailing: const Icon(Icons.attach_money),
                  tileColor: WidgetStateProperty.resolveWith((s) {
                    if (s.isPressed) {
                      return i.transactionType == "Expense"
                          ? themeProvider.errorTheme.errorContainer
                              .toAccentColor()
                              .dark
                          : themeProvider.successTheme.primaryContainer
                              .toAccentColor()
                              .dark;
                    }
                    return i.transactionType == "Expense"
                        ? themeProvider.errorTheme.errorContainer
                        : themeProvider.successTheme.primaryContainer;
                  }),
                  onPressed: () => showContentDialog(context, i),
                  leading: Icon(
                    i.transactionType == "Expense"
                        ? Icons.trending_down
                        : Icons.trending_up,
                    color: i.transactionType == "Expense"
                        ? themeProvider.errorTheme.onErrorContainer
                        : themeProvider.successTheme.onPrimaryContainer,
                  ),
                  title: Text(
                    '${i.category}: ${i.amount}',
                    style: TextStyle(
                      color: i.transactionType == "Expense"
                          ? themeProvider.errorTheme.error
                          : themeProvider.successTheme.primary,
                    ),
                  ),
                ),
            ],
          )
        ]
        // ),
        );
  }
}
