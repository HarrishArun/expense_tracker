import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('₹ ${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Icon(CateogryIcon[expense.cateogry]),
                    SizedBox(
                      width: 8,
                    ),
                    Text(expense.formatteddate)
                  ],
                )
              ],
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}
