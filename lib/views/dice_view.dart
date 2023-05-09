import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dice_controller.dart';
import '../widgets/dice.dart';
import '../widgets/gradient_container.dart';

class Home extends GetView<DiceController> {
  const Home({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('中午吃什么'),
      ),
      body: GradientContainer.purple(
          child: Dice(
        options: const ['沙县', '便利店', '食堂', '西餐', '麦当劳', '不吃了'],
      )),
    );
  }
}
