import 'package:basic_flutter_demo/views/expense_tracker/widgets/expense_item.dart';
import 'package:flutter/cupertino.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final Function(Expense expense) onExpenseRemoved;

  const ExpenseList(
      {super.key, required this.expenses, required this.onExpenseRemoved});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onExpenseRemoved(expenses[index]);
            },
            child: ExpenseItem(expense: expenses[index])));
  }
}
