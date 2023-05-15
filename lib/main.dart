import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/expenses_binding.dart';
import 'views/expenses_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final myColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightGreen);
    final myDarkColorScheme = ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.deepPurple);

    return GetMaterialApp(
      initialRoute: '/expenses',
      getPages: [
        GetPage(
          name: '/expenses',
          page: () => const Expenses(),
          binding: ExpensesBinding(),
        ),
      ],
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: myColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                color: myColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: myDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: myDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myDarkColorScheme.primaryContainer,
            foregroundColor: myDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      // themeMode: ThemeMode.dark,
    );
  }
}
