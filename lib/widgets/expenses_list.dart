import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expenser.dart';
import 'package:expense_tracker/widgets/expenses_item.dart';
import 'package:flutter/material.dart';

class Expenseslist extends StatelessWidget {
  late final List<Expense> expenses;
  final void Function(Expense expenses) onremoveexpense;
  Expenseslist(this.expenses, this.onremoveexpense);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) => Dismissible(
            onDismissed: (direction) {
              onremoveexpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index]),
            key: ValueKey(expenses[index]),
          )),
      itemCount: expenses.length,
    );
  }
}
