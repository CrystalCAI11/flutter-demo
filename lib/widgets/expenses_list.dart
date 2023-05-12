import 'package:expense_tracker_app/controllers/expenses_controller.dart';
import 'package:expense_tracker_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key});
  final ExpensesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: controller.registeredExpenses.length, // call几次itemBuilder
          itemBuilder: (context, index) =>
              ExpenseItem(controller.registeredExpenses[index]),
        ));
  }
}
