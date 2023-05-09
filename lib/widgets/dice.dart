import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dice_controller.dart';

class Dice extends StatelessWidget {
  Dice({super.key, required this.options});

  final List<String> options;
  final DiceController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              controller.rollDice();
            },
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0)
                  .animate(controller.animationController),
              child: Obx(() => Image.asset(
                    'assets/dice-${controller.count}.png',
                    width: 300,
                  )),
            ),
          ),
          const SizedBox(height: 50),
          Column(
            children: options.map((option) {
              int index = options.indexOf(option);
              return _Text('${index + 1} - $option');
            }).toList(),
          )
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 28),
    );
  }
}
