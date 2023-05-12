import 'package:expense_tracker_app/controllers/expenses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../models/expense_model.dart';

class NewExpense extends StatelessWidget {
  NewExpense({super.key});

  final ExpensesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: controller.titleController,
          maxLength: 50,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.amountController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => Text(controller.pickedDate.value == null
                      ? 'No date Selected'
                      : DateFormat.yMd().format(controller.pickedDate.value!))),
                  IconButton(
                      onPressed: () => controller.openDatePicker(context),
                      icon: const Icon(Icons.calendar_month))
                ],
              ),
            )
          ],
        ),
        const SizedBox(width: 16),
        Row(children: [
          Obx(() => DropdownButton(
              value: controller.selectedCategory.value,
              items: Category.values
                  .map((e) => DropdownMenuItem(
                      value: e, child: Text(e.name.toUpperCase())))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.selectCategory(value);
                }
              })),
          const Spacer(),
          TextButton(onPressed: () => controller.closeModal(), child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                controller.saveNewExpense(context);
              },
              child: const Text('Save'))
        ]),
      ]),
    );
  }
}
