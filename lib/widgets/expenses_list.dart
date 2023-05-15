import 'package:expense_tracker_app/controllers/expenses_controller.dart';
import 'package:expense_tracker_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key});
  final ExpensesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        itemCount: controller.registeredExpenses.length, // call几次itemBuilder
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(controller.registeredExpenses[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: Theme.of(context).cardTheme.margin,
          ),
          onDismissed: (direction) {
            controller.removeExpense(index, context);
          },
          child: ExpenseItem(controller.registeredExpenses[index]),
        ),
      ),
    );
  }
}
