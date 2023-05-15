import 'package:expense_tracker_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.data, {super.key});

  final ExpenseModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$ ${data.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[data.category]),
                    const SizedBox(width: 8),
                    Text(data.formattedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
