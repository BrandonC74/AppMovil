import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  AnimationController? _animationController;
  Animation<double>? _rotationAnimation;
  
  // Enhanced dark theme colors for better visibility
  final Color _darkPrimary = const Color(0xFF42A5F5);  // Brighter blue
  final Color _darkSecondary = const Color(0xFF00E5FF); // Vibrant teal
  final Color _darkBackground = const Color(0xFF121212);
  final Color _darkCard = const Color(0xFF1E1E1E);
  final Color _darkText = const Color(0xFFEEEEEE);     // Brighter text
  final Color _darkError = const Color(0xFFEF5350);    // Brighter red
  final Color _darkIcon = const Color(0xFFFFD600);     // Vibrant yellow for icons

  ThemeMode get themeMode => _themeMode;

  void setAnimationController(AnimationController controller) {
    _animationController = controller;
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  Animation<double>? get rotationAnimation => _rotationAnimation;

  ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: _darkPrimary,
          secondary: _darkSecondary,
          surface: _darkCard,
          error: _darkError,
          onPrimary: Colors.black,
          onSecondary: Colors.black,
          onSurface: _darkText,
          onError: Colors.black,
        ),
        scaffoldBackgroundColor: _darkBackground,
        cardColor: _darkCard,
        appBarTheme: AppBarTheme(
          backgroundColor: _darkCard,  // Slightly lighter than background
          foregroundColor: _darkText,
          elevation: 2,
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: _darkText, fontSize: 24, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(color: _darkText, fontSize: 20),
          displaySmall: TextStyle(color: _darkText, fontSize: 16),
          // Add all other text styles...
        ),
        iconTheme: IconThemeData(
          color: _darkIcon,  // Using vibrant yellow for better visibility
          size: 24,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _darkPrimary,
            foregroundColor: Colors.black,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _darkSecondary,
          foregroundColor: Colors.black,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  Future<void> toggleTheme(bool isDark) async {
    if (_animationController != null) {
      await _animationController!.forward(from: 0);
    }
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}