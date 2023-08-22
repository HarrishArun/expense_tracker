import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_item.dart';
import 'package:flutter/material.dart';

class Expenseslist extends StatelessWidget {
  late final List<Expense> expenses;
  Expenseslist(this.expenses);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) => ExpenseItem(expenses[index])),
      itemCount: expenses.length,
    );
  }
}
