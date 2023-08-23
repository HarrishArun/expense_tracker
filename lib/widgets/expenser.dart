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
      builder: (ctx) => newexpenses(
        onaddexpense: _addexpense,
      ),
    );
  }

  void _addexpense(Expense expense) {
    setState(() {
      _registeredexpenses.add(expense);
    });
  }

  void _removeexpense(Expense expense) {
    final expenseindex = _registeredexpenses.indexOf(expense);
    setState(() {
      _registeredexpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Expense Removed"),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredexpenses.insert(expenseindex, expense);
            });
          }),
    ));
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
              child: _registeredexpenses.isNotEmpty
                  ? Expenseslist(_registeredexpenses, _removeexpense)
                  : Center(child: (Text("Add Expeneses!")))
              // height: 500,
              )
        ],
      ),
    );
  }
}
