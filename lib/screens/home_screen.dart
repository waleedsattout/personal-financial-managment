import 'dart:math';

import 'package:finance_manager/models/expense.dart';
import 'package:finance_manager/providers/theme_provider.dart';
import 'package:finance_manager/screens/add_transaction_screen.dart';
import 'package:finance_manager/screens/transaction_details_screen.dart';
import 'package:finance_manager/services/hive_service.dart';
import 'package:finance_manager/widgets/fab.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart' hide Card, showDialog, FilledButton;
import 'package:flutter/material.dart' as material;

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<Expense>? _expenseBox;
  late ThemeProvider themeProvider;
  double budget = 0;
  final images = [
    "assets/8699670.webp",
    "assets/credit_card.png",
    "assets/money-bag.png",
    "assets/8699673.webp"
  ];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _expenseBox = await HiveService().openBox();
    HiveService().calculateBudget().then((e) {
      if (!mounted) return;
      setState(() {
        budget = e;
      });
    });
  }

  Widget card(Expense item) {
    var color = item.transactionType == "Income" ? "success" : "error";
    var title = item.amount.toString();
    var subtitle = item.category;

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
      color: bgColor,
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textColor: Colors.white,
      elevation: 8.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.45,
            alignment: Alignment.topCenter,
            image: AssetImage(images[Random().nextInt(4)]),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: tintColor.toAccentColor().dark,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                    widthFactor: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      child: Text(
                        DateFormat("y-M-d").format(item.date),
                        style: TextStyle(
                            fontFamily: GoogleFonts.playfair().fontFamily,
                            fontSize: 14,
                            color: bgColor.toAccentColor().dark),
                      ),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: tintColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontFamily: GoogleFonts.playfair().fontFamily,
                            fontSize: 24,
                            color: fgColor,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                              fontFamily: GoogleFonts.playfair().fontFamily,
                              color: fgColor),
                        ),
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

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(children: [
      material.RefreshIndicator(
        onRefresh: () async {
          HiveService().calculateBudget().then((e) {
            setState(() {
              budget = e;
            });
          });
        },
        child: ScaffoldPage.scrollable(
          padding: const EdgeInsets.only(
            top: 0,
            bottom: 24,
            right: 12,
            left: 12,
          ),
          children: [
            SizedBox.fromSize(
              size: Size(
                MediaQuery.of(context).size.width * 0.583,
                MediaQuery.of(context).size.width * 0.583,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "assets/btc.png",
                ),
              ),
            ),
            Card(
              backgroundColor: budget < 0
                  ? themeProvider.errorTheme.error
                  : themeProvider.primaryTheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$$budget',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.primaryTheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total Budget',
                      style: TextStyle(
                        fontSize: FluentTheme.of(context)
                            .typography
                            .bodyStrong
                            ?.fontSize,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.primaryTheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Last Transactions',
                style: FluentTheme.of(context).typography.subtitle,
              ),
            ),
            _expenseBox == null
                ? const Center(
                    child: ProgressRing(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: (List<Expense> values) {
                        values.sort((a, b) {
                          return -a.date.compareTo(b.date);
                        });
                        return values;
                      }(_expenseBox!.values.toList())
                          .take(10)
                          .map((item) {
                        return StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: card(item),
                        );
                      }).toList() as List<Widget>,
                    ),
                  ),
          ],
        ),
      ),
      Positioned(
        bottom: 16.0,
        right: 16.0,
        child: Fab(
          onPressed: () {
            Navigator.push(context, FluentPageRoute(builder: (context) {
              return const AddTransactionScreen(
                withHeader: true,
              );
            }));
          },
          child: const Icon(FluentIcons.add),
        ),
      ),
    ]);
  }
}
