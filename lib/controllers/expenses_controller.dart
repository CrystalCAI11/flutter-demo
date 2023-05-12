import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// final formatter = DateFormat.yMd();

class ExpensesController extends GetxController {
  final List<ExpenseModel> registeredExpenses = [
    ExpenseModel(
        title: 'flutter',
        amount: 19.9,
        date: DateTime.now(),
        category: Category.work),
    ExpenseModel(
        title: 'food',
        amount: 2.9,
        date: DateTime.now(),
        category: Category.food)
  ].obs;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final selectedCategory = Category.food.obs;

  final pickedDate = Rxn<DateTime>();

  Future<void> openDatePicker(context) async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final temp = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    if (temp != null) {
      pickedDate.value = temp;
    }
  }

  void selectCategory(Category category) {
    selectedCategory.value = category;
  }

  void saveNewExpense(context) {
    final enteredAmount = double.tryParse(amountController.text);
    if (titleController.text.trim().isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        pickedDate.value == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('ERROR!'),
          content: const Text(
              'Please make sure a valid title, amount, date was entered.'),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text('Okay'))
          ],
        ),
      );
      return;
    } else {
      final newExpense = ExpenseModel(
          title: titleController.text,
          amount: enteredAmount,
          date: pickedDate.value!,
          category: selectedCategory.value);
      registeredExpenses.add(newExpense);
      closeModal();
    }
  }

  closeModal() {
    Get.back();
    titleController.clear();
    amountController.clear();
    pickedDate.value = null;
    selectedCategory.value = Category.food;
  }

  @override
  void onClose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }
}
