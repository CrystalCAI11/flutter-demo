import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    required this.color1,
    required this.color2,
    required this.child,
    super.key,
  });

  // 可以写多个constructor
  const GradientContainer.purple({super.key, required this.child})
      : color1 = Colors.deepPurple,
        color2 = Colors.lightBlue;

  final Color color1;
  final Color color2;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: child,
    );
  }
}
