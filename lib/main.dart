import 'package:flutter/material.dart';

import 'models/models.dart';

void main() {
  runApp(const NutriApp());
}

class NutriApp extends StatelessWidget {
  const NutriApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.green,
      secondary: Colors.deepOrange,
    );

    final themeData = ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        shadowColor: colorScheme.shadow,
      ),
    );

    // Kiểm tra nhanh model Food hoạt động
    const sample = Food(
      id: 'test',
      name: 'Phở gà',
      mealType: 'sang',
      calories: 430,
      protein: 28,
      fat: 9,
      carbs: 58,
    );

    return MaterialApp(
      title: 'NutriVN',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('NutriVN')),
          body: Center(
            child: Text(
              'Welcome to NutriVN\n${sample.name}: ${sample.calories} kcal',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
