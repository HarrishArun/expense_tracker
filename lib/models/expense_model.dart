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
