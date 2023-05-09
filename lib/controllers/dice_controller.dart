import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'dart:math';

class DiceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late AnimationController animationController;
  final isCanTap = true.obs;

  @override
  void onInit() {
    super.onInit();
    count.value = 1;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 500),
    );
  }

  void rollDice() {
    if (isCanTap.value) {
      isCanTap.value = false; // 动画中点击无效
      animationController.repeat();
      Future.delayed(const Duration(milliseconds: 500), () {
        Random random = Random();
        count.value = random.nextInt(6) + 1;
        animationController.reset();
        isCanTap.value = true;
      });
    }
  }
}
