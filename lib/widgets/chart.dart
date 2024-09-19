import 'package:finance_manager/models/expense.dart';
import 'package:finance_manager/providers/theme_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class ExpenseIncomeChartSwitcher extends StatefulWidget {
  final bool isYearly;
  final List<Expense> expenses;
  final List<Expense> incomes;
  const ExpenseIncomeChartSwitcher(
      {super.key,
      this.isYearly = false,
      required this.expenses,
      required this.incomes});

  @override
  State<ExpenseIncomeChartSwitcher> createState() =>
      _ExpenseIncomeChartSwitcherState();
}

class _ExpenseIncomeChartSwitcherState
    extends State<ExpenseIncomeChartSwitcher> {
  late ThemeProvider themeProvider;
  List<Expense> yearlyExpense = [];
  List<Expense> yearlyIncome = [];

  @override
  void initState() {
    super.initState();
    var exp = widget.expenses;

    yearlyExpense = () {
      exp.sort((a, b) => -a.date.compareTo(b.date));
      return exp.toList();
    }()
        .toList();
  }

  final List<FlSpot> expensesSpots = [
    const FlSpot(0, 1500),
    const FlSpot(1, 2000),
    const FlSpot(2, 1800),
    const FlSpot(3, 2200),
    const FlSpot(4, 2300),
    const FlSpot(5, 2500),
  ];

  final List<FlSpot> incomeSpots = [
    const FlSpot(0, 3500),
    const FlSpot(1, 3700),
    const FlSpot(2, 3600),
    const FlSpot(3, 4000),
    const FlSpot(4, 4200),
    const FlSpot(5, 4500),
  ];

  @override
  Widget build(BuildContext context) {
    var x = [0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    for (var i = 0; i < widget.incomes.length; i++) {
      x[widget.incomes[i].date.month - 1] += widget.incomes[i].amount;
    }

    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.7,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LineChart(
              widget.isYearly ? yearChartData : monthChartData,
              duration: const Duration(milliseconds: 250),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  color:
                      themeProvider.errorTheme.error, // Color for Expenses line
                ),
                const SizedBox(width: 8),
                const Text('Expenses', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(width: 24),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  color: themeProvider
                      .successTheme.primary, // Color for Income line
                ),
                const SizedBox(width: 8),
                const Text('Income', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(width: 24),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  color: themeProvider
                      .primaryTheme.primary, // Color for Budget line
                ),
                const SizedBox(width: 8),
                const Text('Budget', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  LineChartBarData get budgetLineData => LineChartBarData(
        isCurved: true,
        barWidth: 8,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: false),
        color: themeProvider.primaryTheme.primary, // Color for the budget line
        dotData: const FlDotData(show: false),
        spots: [
          for (int i = 0; i < expensesSpots.length; i++)
            FlSpot(
              expensesSpots[i].x,
              incomeSpots[i].y - expensesSpots[i].y, // Budget calculation
            ),
        ],
      );
  LineChartData get yearChartData => LineChartData(
        clipData: const FlClipData.all(),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 5000,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: bottomTitlesForYear,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: leftTitles,
              reservedSize: 40,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: themeProvider.primaryTheme.primary.withOpacity(0.5),
              strokeWidth: 0.4,
              dashArray: [8, 4],
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: themeProvider.primaryTheme.primary.withOpacity(0.5),
              strokeWidth: 0.4,
              dashArray: [8, 4],
            );
          },
        ),
        borderData: FlBorderData(
            show: true,
            border: Border.all(
                color: themeProvider.primaryTheme.primary, width: 1)),
        lineBarsData: [
          expensesLineDataYear,
          incomesLineDataYear,
          budgetLineData
        ],
      );

  LineChartData get monthChartData => LineChartData(
        minX: 0,
        maxX: 30,
        minY: 0,
        maxY: 5000,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              getTitlesWidget: bottomTitlesForMonth,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: leftTitles,
              reservedSize: 40,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: const FlGridData(show: true),
        borderData: FlBorderData(
            show: true,
            border: Border.all(
                // color: Colors.red,
                width: 1)),
        lineBarsData: [expensesLineDataMonth, incomesLineDataMonth],
      );

  LineChartBarData get expensesLineDataYear => LineChartBarData(
        isCurved: true,
        color: themeProvider.errorTheme.error,
        barWidth: 8,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: false),
        spots: [
          for (var i in widget.expenses)
            FlSpot(widget.expenses.indexOf(i).toDouble(), i.amount)
        ],
      );

  LineChartBarData get incomesLineDataYear => LineChartBarData(
        isCurved: true,
        color: themeProvider.successTheme.primary,
        barWidth: 8,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 3500),
          FlSpot(1, 3700),
          FlSpot(2, 3600),
          FlSpot(3, 4000),
          FlSpot(4, 4200),
          FlSpot(5, 4500),
          // FlSpot(6, 4400),
          // FlSpot(7, 4700),
          // FlSpot(8, 4800),
          // FlSpot(9, 4900),
          // FlSpot(10, 5000),
          // FlSpot(11, 5200),
        ],
      );

  LineChartBarData get expensesLineDataMonth => LineChartBarData(
        isCurved: true,
        // color: Colors.redAccent,
        barWidth: 8,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 1500),
          FlSpot(5, 1700),
          FlSpot(10, 1800),
          // FlSpot(15, 2100),
          // FlSpot(20, 2300),
          // FlSpot(25, 2400),
          // FlSpot(30, 2500),
        ],
      );

  LineChartBarData get incomesLineDataMonth => LineChartBarData(
        isCurved: true,
        // color: Colors.greenAccent,
        barWidth: 8,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 2500), // Day 1
          FlSpot(5, 2800), // Day 6
          FlSpot(10, 2900), // Day 11
          FlSpot(15, 3200), // Day 16
          FlSpot(20, 3400), // Day 21
          FlSpot(25, 3600), // Day 26
          FlSpot(30, 3800), // Day 31
        ],
      );

  Widget bottomTitlesForYear(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    switch (value.toInt()) {
      case 0:
        return const Text('Jan', style: style);
      case 1:
        return const Text('Feb', style: style);
      case 2:
        return const Text('Mar', style: style);
      case 3:
        return const Text('Apr', style: style);
      case 4:
        return const Text('May', style: style);
      case 5:
        return const Text('Jun', style: style);
      case 6:
        return const Text('Jul', style: style);
      case 7:
        return const Text('Aug', style: style);
      case 8:
        return const Text('Sep', style: style);
      case 9:
        return const Text('Oct', style: style);
      case 10:
        return const Text('Nov', style: style);
      case 11:
        return const Text('Dec', style: style);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget bottomTitlesForMonth(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return Text(value.toInt().toString(), style: style); // Days of the month
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return Text(value.toInt().toString(), style: style); // Y-axis values
  }
}
