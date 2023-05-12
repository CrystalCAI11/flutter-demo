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
    return GetMaterialApp(
      initialRoute: '/expenses',
      getPages: [
        GetPage(name: '/expenses', page: () => const Expenses(), binding: ExpensesBinding()),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
       useMaterial3: true
      ),
    );
  }
}
