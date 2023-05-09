import 'package:flutter/material.dart';
import '../bindings/dice_binding.dart';
import '../views/dice_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '中午吃什么',
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const Home(), binding: DiceBinding())
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
