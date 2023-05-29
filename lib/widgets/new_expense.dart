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
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    // use LayoutBuilder to get the constraints of parents
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      final widgetTitle = TextField(
        controller: controller.titleController,
        maxLength: 50,
        decoration: const InputDecoration(labelText: 'Title'),
      );

      final widgetAmount = Expanded(
        child: TextField(
          controller: controller.amountController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          decoration: const InputDecoration(
            labelText: 'Amount',
            prefixText: '\$',
          ),
        ),
      );

      final widgetDropdownButton = Obx(() => DropdownButton(
          value: controller.selectedCategory.value,
          items: Category.values
              .map((e) =>
                  DropdownMenuItem(value: e, child: Text(e.name.toUpperCase())))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              controller.selectCategory(value);
            }
          }));

      final widgetDatePicker = Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
                  controller.pickedDate.value == null
                      ? 'No date Selected'
                      : DateFormat.yMd().format(controller.pickedDate.value!),
                )),
            IconButton(
              onPressed: () => controller.openDatePicker(context),
              icon: const Icon(Icons.calendar_month),
            )
          ],
        ),
      );

      final widgetButtons = [
        const Spacer(),
        TextButton(
          onPressed: () => controller.closeModal(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            controller.saveNewExpense(context);
          },
          child: const Text('Save'),
        )
      ];
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                // 第一行
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: widgetTitle),
                      const SizedBox(width: 24),
                      widgetAmount,
                    ],
                  )
                else
                  widgetTitle,

                // 第二行
                if (width >= 600)
                  Row(
                    children: [
                      widgetDropdownButton,
                      const SizedBox(width: 24),
                      widgetDatePicker,
                    ],
                  )
                else
                  Row(
                    children: [
                      widgetAmount,
                      const SizedBox(width: 16),
                      widgetDatePicker,
                    ],
                  ),
                const SizedBox(width: 16),

                // 第三行
                if (width >= 600)
                  Row(
                    children: [...widgetButtons],
                  )
                else
                  Row(
                    children: [
                      widgetDropdownButton,
                      ...widgetButtons,
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
