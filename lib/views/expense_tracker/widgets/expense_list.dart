import 'package:basic_flutter_demo/views/expense_tracker/widgets/expense_item.dart';
import 'package:flutter/cupertino.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expense: expenses[index]));
  }
}
