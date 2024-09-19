import 'dart:ui';
import 'package:finance_manager/models/expense.dart';
import 'package:finance_manager/providers/theme_provider.dart';
import 'package:finance_manager/screens/add_transaction_screen.dart';
import 'package:finance_manager/screens/analytics_screen.dart';
import 'package:finance_manager/screens/home_screen.dart';
import 'package:finance_manager/screens/recuring_transaction_screen.dart';
import 'package:finance_manager/screens/transaction_list_screen.dart';
import 'package:finance_manager/services/hive_service.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class temp {}

Future<void> main() async {
  await HiveService().openBox();
  await Hive.openBox<Expense>('transactions');
  runApp(const MyApp());
  if (PlatformDispatcher.instance.platformBrightness == Brightness.light) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0x09ffffff),
        statusBarIconBrightness: Brightness.dark));
  } else {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0x00282828),
        statusBarIconBrightness: Brightness.light));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) =>
                ThemeProvider(PlatformDispatcher.instance.platformBrightness),
          ),
        ],
        child: FluentApp(
          title: 'Finance Manager',
          theme: FluentThemeData(
            brightness: MediaQuery.of(context).platformBrightness,
            fontFamily: GoogleFonts.playfair().fontFamily,
            accentColor:
                ThemeProvider(PlatformDispatcher.instance.platformBrightness)
                    .primaryTheme
                    .primary
                    .toAccentColor(),
          ),
          debugShowCheckedModeBanner: false,
          home: const NavigationViewExample(),
        ));
  }
}

class NavigationViewExample extends StatefulWidget {
  const NavigationViewExample({super.key});

  @override
  State<NavigationViewExample> createState() => _NavigationViewExampleState();
}

class _NavigationViewExampleState extends State<NavigationViewExample> {
  int selectedIndex = 0;
  bool isDarkMode = false;
  bool isNotificationsEnabled = true;
  late ThemeProvider themeProvider;

  final simpleCommandBarItems = <CommandBarItem>[
    CommandBarButton(
      icon: const Icon(FluentIcons.add),
      label: const Text('New'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.delete),
      label: const Text('Delete'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.archive),
      label: const Text('Archive'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.move),
      label: const Text('Move'),
      onPressed: () {},
    ),
  ];

  final moreCommandBarItems = <CommandBarItem>[
    CommandBarButton(
      icon: const Icon(FluentIcons.reply),
      label: const Text('Reply'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.reply_all),
      label: const Text('Reply All'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.forward),
      label: const Text('Forward'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.search),
      label: const Text('Search'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.pin),
      label: const Text('Pin'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.unpin),
      label: const Text('Unpin'),
      onPressed: () {},
    ),
    CommandBarButton(
      icon: const Icon(FluentIcons.unpin),
      label: const Text('Unpin'),
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Your success starts here',
          style: TextStyle(
              color: themeProvider.primaryTheme.onSurface, fontSize: 16),
        ),
      ),
      pane: NavigationPane(
        selected: selectedIndex,
        onChanged: (index) => setState(() => selectedIndex = index),
        displayMode: PaneDisplayMode.auto,
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text('Home'),
            body: const HomePage(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.add),
            title: const Text('Add Transaction'),
            body: const AddTransactionScreen(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.grouped_list),
            title: const Text('Transaction List'),
            body: const TransactionListScreen(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.chart),
            title: const Text('Reports and Analytics'),
            body: const AnalyticsScreen(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.chart),
            title: const Text('Recurring Transaction'),
            body: const RecurringTransactionScreen(),
          ),
          PaneItemExpander(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
            body: SettingsPage(
              isDarkMode: isDarkMode,
              onDarkModeChanged: (value) {
                setState(() => isDarkMode = value);
              },
              isNotificationsEnabled: isNotificationsEnabled,
              onNotificationsChanged: (value) {
                setState(() => isNotificationsEnabled = value);
              },
            ),
            items: [
              PaneItem(
                icon: const Icon(FluentIcons.mail),
                title: const Text('Mail'),
                body: const Text("qw"),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.calendar),
                title: const Text('Calendar'),
                body: const Text("qw"),
              ),
            ],
          ),
        ],
        footerItems: [
          PaneItem(
            icon: const Icon(FluentIcons.info),
            title: const Text('About'),
            body: const Center(child: Text('About Page')),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onDarkModeChanged;
  final bool isNotificationsEnabled;
  final ValueChanged<bool> onNotificationsChanged;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.onDarkModeChanged,
    required this.isNotificationsEnabled,
    required this.onNotificationsChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Settings')),
      children: [
        Text('Appearance', style: FluentTheme.of(context).typography.subtitle),
        ToggleSwitch(
          checked: widget.isDarkMode,
          onChanged: widget.onDarkModeChanged,
          content: Text(widget.isDarkMode ? 'Dark Mode' : 'Light Mode'),
        ),
        const SizedBox(height: 20),
        Text('Notifications',
            style: FluentTheme.of(context).typography.subtitle),
        ToggleSwitch(
          checked: widget.isNotificationsEnabled,
          onChanged: widget.onNotificationsChanged,
          content: Text(widget.isNotificationsEnabled ? 'Enabled' : 'Disabled'),
        ),
        const SizedBox(height: 20),
        Button(
          child: const Text('Save Settings'),
          onPressed: () {},
        ),
      ],
    );
  }
}

List<FlSpot> generatePredictedSpotsWithMovingAverage(
    List<FlSpot> existingSpots, int futurePointsCount, int windowSize) {
  if (existingSpots.length < windowSize) return existingSpots;

  List<FlSpot> predictedSpots = List.from(existingSpots);
  double lastX = existingSpots.last.x;

  // Predict future points using the moving average of the last 'windowSize' points
  for (int i = 1; i <= futurePointsCount; i++) {
    double sumY = 0;

    // Calculate the average of the last 'windowSize' y-values
    for (int j = existingSpots.length - windowSize;
        j < existingSpots.length;
        j++) {
      sumY += existingSpots[j].y;
    }

    double averageY = sumY / windowSize;

    // Add the new point to the prediction list
    double newX = lastX + i;
    predictedSpots.add(FlSpot(newX, averageY));

    // Update existingSpots to include the new predicted point for further averaging
    predictedSpots.add(FlSpot(newX, averageY));
  }

  return predictedSpots;
}

List<FlSpot> generatePredictedSpots(
    List<FlSpot> existingSpots, int futurePointsCount) {
  // Ensure we have enough points for prediction
  if (existingSpots.length < 2) return existingSpots;

  // Calculate slope (m) and intercept (b) of the line: y = mx + b
  final int n = existingSpots.length;
  double sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0;

  for (var spot in existingSpots) {
    sumX += spot.x;
    sumY += spot.y;
    sumXY += spot.x * spot.y;
    sumX2 += spot.x * spot.x;
  }

  final double slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX);
  final double intercept = (sumY - slope * sumX) / n;

  // Generate future points based on the linear model
  List<FlSpot> predictedSpots = List.from(existingSpots);
  double lastX = existingSpots.last.x;

  for (int i = 1; i <= futurePointsCount; i++) {
    final double newX = lastX + i;
    final double newY = slope * newX + intercept;
    predictedSpots.add(FlSpot(newX, newY));
  }

  return predictedSpots;
}

/*
CommandBar(
          overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
          primaryItems: [
            CommandBarButton(
              icon: const Icon(FluentIcons.add),
              label: const Text('New'),
              onPressed: () => {},
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.delete),
              label: const Text('Delete'),
              onPressed: () {},
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.archive),
              label: const Text('Archive'),
              onPressed: () {},
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.move),
              label: const Text('Move'),
              onPressed: () {},
            ),
            const CommandBarButton(
              icon: Icon(FluentIcons.cancel),
              label: Text('Disabled'),
              onPressed: null,
            ),
          ],
        ),

 */
