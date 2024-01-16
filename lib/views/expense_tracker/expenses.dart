import 'package:basic_flutter_demo/views/expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.learn),
    Expense(
        title: "Cinema",
        amount: 16.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Burger",
        amount: 3.49,
        date: DateTime.now(),
        category: Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(child: ExpenseList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
