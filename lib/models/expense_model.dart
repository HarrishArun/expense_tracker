import 'package:expense_tracker/widgets/expenser.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import "package:intl/intl.dart";

final formatter = DateFormat.yMMMEd();

final uuid = Uuid();

enum Cateogry { food, travel, lesure, work }

const CateogryIcon = {
  Cateogry.food: Icons.lunch_dining,
  Cateogry.travel: Icons.flight_takeoff,
  Cateogry.lesure: Icons.movie,
  Cateogry.work: Icons.work
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Cateogry cateogry;
  String get formatteddate {
    return formatter.format(date);
  }

  Expense(this.title, this.amount, this.date, this.cateogry) : id = uuid.v4();
}

class Expensebucket {
  final Cateogry cateogry;
  final List<Expense> expenses;
  Expensebucket(this.cateogry, this.expenses);
  Expensebucket.forcateogry(List<Expense> allexpense, this.cateogry)
      : expenses = allexpense
            .where((expenses) => expenses.cateogry == cateogry)
            .toList();
  double get totalExpeneses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
