import 'package:flutter/material.dart';

class ExpenseTrackerHome extends StatefulWidget {
  final String pageTitle;

  const ExpenseTrackerHome({super.key, required this.pageTitle});

  @override
  State<ExpenseTrackerHome> createState() => _ExpenseTrackerHome();
}

class _ExpenseTrackerHome extends State<ExpenseTrackerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Expense Tracker")],
        ),
      ),
    );
  }
}
