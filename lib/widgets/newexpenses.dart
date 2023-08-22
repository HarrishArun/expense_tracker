import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class newexpenses extends StatefulWidget {
  const newexpenses({super.key});

  @override
  State<newexpenses> createState() => _newexpensesState();
}

class _newexpensesState extends State<newexpenses> {
  final _titlecontroller = TextEditingController();
  final _amountcontoller = TextEditingController();
  DateTime? _selecteddate;
  late Cateogry _selectedcateogry = Cateogry.travel;
  void _showdatepicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month, now.day);
    final pickeddate = await showDatePicker(
        context: context, initialDate: now, firstDate: first, lastDate: now);
    setState(() {
      _selecteddate = pickeddate;
    });
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontoller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountcontoller,
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefix: Text('\₹'),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_selecteddate == null
                      ? "Select Date"
                      : formatter.format(_selecteddate!)),
                  IconButton(
                      onPressed: () {
                        _showdatepicker();
                      },
                      icon: Icon(Icons.calendar_month,
                          color: _selecteddate == null
                              ? Colors.black87
                              : Colors.deepPurple))
                ],
              ))
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedcateogry,
                  items: Cateogry.values
                      .map((cateogry) => DropdownMenuItem(
                          value: cateogry,
                          child: Text(cateogry.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedcateogry = value!;
                    });
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close")),
              ElevatedButton(onPressed: () {}, child: Text("Save"))
            ],
          )
        ],
      ),
    );
  }
}
