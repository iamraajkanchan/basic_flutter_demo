import 'package:basic_flutter_demo/views/expense_tracker/widgets/expense_list.dart';
import 'package:basic_flutter_demo/views/expense_tracker/widgets/new_expense.dart';
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

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void _showAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return NewExpense(onAddExpense: _addExpense);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: _showAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          // Note: When you are using a ListView, you must wrap the widget inside Expanded Widget.
          Expanded(
              child: ExpenseList(
            expenses: _registeredExpenses,
            onExpenseRemoved: _removeExpense,
          ))
        ],
      ),
    );
  }
}
