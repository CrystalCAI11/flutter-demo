import 'package:expense_tracker_app/controllers/expenses_controller.dart';
import 'package:expense_tracker_app/widgets/expenses_list.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Expenses extends GetView<ExpensesController> {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    void openAddOverlay() {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(),
      );
    }

    Widget emptyContent = const Center(
      child: Text('No expenses found.'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: openAddOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Obx(() => controller.registeredExpenses.isEmpty
          ? emptyContent
          : ExpensesList()),
    );
  }
}
