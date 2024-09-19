import 'package:finance_manager/themes/colors.dart';
import 'package:finance_manager/themes/error_theme.dart';
import 'package:finance_manager/themes/primary_theme.dart';
import 'package:finance_manager/themes/success_theme.dart';
import 'package:finance_manager/themes/warning_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  late ColorScheme errorTheme;
  late ColorScheme warningTheme;
  late ColorScheme successTheme;
  late ColorScheme primaryTheme;
  late Map<String, Color> appTheme;

  late Brightness brightness;

  ThemeProvider(Brightness brightness) {
    updateBrightness(brightness);
  }

  void updateBrightness(Brightness brightness) {
    this.brightness = brightness;
    appTheme = AppColors().getColors();
    if (Brightness.light == brightness) {
      errorTheme = ErrorTheme.lightScheme();
      warningTheme = WarningTheme.lightScheme();
      successTheme = SuccessTheme.lightScheme();
      primaryTheme = PrimaryTheme.lightScheme();
    } else {
      errorTheme = ErrorTheme.darkScheme();
      warningTheme = WarningTheme.darkScheme();
      successTheme = SuccessTheme.darkScheme();
      primaryTheme = PrimaryTheme.darkScheme();
    }
    notifyListeners();
  }
}
