import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  late ThemeData _selectedTheme;

  ThemeProvider({
    required bool isDarkMode,
  }) {
    _selectedTheme = isDarkMode ? dark : light;
  }

  ThemeData get getTheme {
    return _selectedTheme;
  }

  Future<void> swapTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _selectedTheme = _selectedTheme == dark ? light : dark;
    preferences.setBool('isDarkMode', _selectedTheme == dark);
    notifyListeners();
  }

  bool get isDarkMode {
    return _selectedTheme == dark;
  }

  ThemeData light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white54,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Colors.green,
          surface: const Color(0xFFf5f5f5),
          background: Colors.white,
        ),
    textTheme: ThemeData.light().textTheme.copyWith(
        titleLarge: const TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: const TextStyle(
          fontSize: 26,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        bodySmall: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        labelLarge: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        labelMedium: const TextStyle(fontSize: 16, color: Colors.black),
        labelSmall: const TextStyle(fontSize: 14, color: Colors.black)),
    bottomNavigationBarTheme:
        ThemeData.light().bottomNavigationBarTheme.copyWith(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.grey,
            ),
            primaryColor: Colors.green,
  );

  ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.white)),
    colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Colors.green,
          surface: const Color(0xFF1a1a1a),
          background: const Color(0xFF2a2a2a),
        ),
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          bodySmall: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          labelLarge: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          labelMedium: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          labelSmall: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
    bottomNavigationBarTheme:
        ThemeData.light().bottomNavigationBarTheme.copyWith(
              backgroundColor: const Color(0xFF1a1a1a),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
            ),
            primaryColor: Colors.green,
  );
}
