import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpenseItem extends StatefulWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  State<StatefulWidget> createState() => _ExpenseItemState();
}

class _ExpenseItemState extends State<ExpenseItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [Text(widget.expense.title)],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text("\$ ${widget.expense.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[widget.expense.category]),
                    const SizedBox(width: 16),
                    Text(widget.expense.formattedDate)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
