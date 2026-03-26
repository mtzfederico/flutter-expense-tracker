import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: "Oat Late", amount: 7.36, date: DateTime.now(), category: Category.food),
    Expense(title: "NYC Subway", amount: 3.00, date: DateTime.now(), category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("CHART GOES HERE"),
          SizedBox(height: 30),
          SizedBox(
            height: 300,
            child: ExpensesList(expenses: _registeredExpenses)
          ),
        ],
      ),
    );
  }
}