import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

// 1️⃣ This provider stores the current theme mode (light or dark)
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

// 2️⃣ This class controls the theme state (light/dark)
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
