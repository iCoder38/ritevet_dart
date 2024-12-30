// notifier
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ritevet_dart/CLASSES/UTILS/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeNotifier() {
    _loadThemePreference(); // Load saved theme when the app starts
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    await _saveThemePreference();
  }

  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false; // Default to light mode
    notifyListeners();
  }

  Future<void> _saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }
}

// service
class ThemeService with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

// toggle
class ThemeToggleWidget extends StatefulWidget {
  const ThemeToggleWidget({super.key});

  @override
  State<ThemeToggleWidget> createState() => _ThemeToggleWidgetState();
}

class _ThemeToggleWidgetState extends State<ThemeToggleWidget> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Choose Theme',
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: themeNotifier.isDarkMode,
          onChanged: (value) {
            themeNotifier.toggleTheme();
            Navigator.pop(context);
            setState(() {
              customLog('refresh theme');
            });
          },
        ),
      ],
    );
  }
}
