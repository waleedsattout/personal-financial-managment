import 'package:finance_manager/providers/theme_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';

class Fab extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String type;
  final String accent;

  const Fab({
    required this.onPressed,
    required this.child,
    this.type = "meduim",
    this.accent = "primary",
    super.key,
  });

  @override
  State<Fab> createState() => _FabState();
}

class _FabState extends State<Fab> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    double size, padding, radius;
    Color accent, onAccent;

    switch (widget.type) {
      case "small":
        size = 40;
        padding = 8;
        radius = 12;
        break;
      case "medium":
        size = 56;
        padding = 16;
        radius = 16;
        break;
      case "large":
        size = 96;
        padding = 36;
        radius = 16;
        break;
      default:
        size = 56;
        padding = 16;
        radius = 16;
        break;
    }

    switch (widget.accent) {
      case "primary":
        accent = themeProvider.primaryTheme.primary;
        onAccent = themeProvider.primaryTheme.onPrimary;
        break;
      case "secondary":
        accent = themeProvider.primaryTheme.secondary;
        onAccent = themeProvider.primaryTheme.onSecondary;
        break;
      case "tertiary":
        accent = themeProvider.primaryTheme.tertiary;
        onAccent = themeProvider.primaryTheme.onTertiary;
        break;
      case "error":
        accent = themeProvider.primaryTheme.error;
        onAccent = themeProvider.primaryTheme.onError;
        break;
      default:
        accent = themeProvider.primaryTheme.primary;
        onAccent = themeProvider.primaryTheme.onPrimary;
        break;
    }

    return SizedBox.fromSize(
      size: Size(size, size),
      child: Button(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius))),
          padding: WidgetStatePropertyAll(EdgeInsets.all(padding)),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.isPressed) {
              return accent.toAccentColor().dark;
            } else if (states.isHovered) {
              return accent.withOpacity(0.95);
            }
            return accent;
          }),
          elevation: WidgetStateProperty.resolveWith((e) {
            if (e.isPressed) {
              return 4;
            } else if (e.isHovered) {
              return 4;
            }
            return 8;
          }),
          foregroundColor: WidgetStatePropertyAll(onAccent),
        ),
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
