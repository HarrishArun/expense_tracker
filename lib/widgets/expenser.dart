import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/newexpenses.dart';
import 'package:flutter/material.dart';

class expenses extends StatefulWidget {
  const expenses({super.key});

  @override
  State<expenses> createState() => _expensesState();
}

class _expensesState extends State<expenses> {
  final List<Expense> _registeredexpenses = [
    Expense("bf", 70, DateTime.now(), Cateogry.food),
    Expense("bus", 85, DateTime.now(), Cateogry.work),
    Expense("bf", 70, DateTime.now(), Cateogry.travel)
  ];
  void _openexoensesoverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => newexpenses(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Expenses"),
            IconButton(
                onPressed: () {
                  _openexoensesoverlay();
                },
                icon: Icon(Icons.add))
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Expenseslist(_registeredexpenses),
            // height: 500,
          )
        ],
      ),
    );
  }
}
