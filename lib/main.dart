import 'package:expense_tracker/widgets/expenser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: expenses(),
  ));
}
