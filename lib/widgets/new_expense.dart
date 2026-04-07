import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final formatter = DateFormat('MMMM d hh:mm a');
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _selectedDate = null;
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: now,
    );

    if (pickedDate == null) {
      print("date is null");
      return;
    }

    final TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (selectedTime == null) {
      print("time is null");
      return;
    }

    setState(() {
      _selectedDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text("Title")),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    label: Text("Amount"),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          Center(
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                    print(
                      _selectedDate == null
                          ? "Date is null"
                          : _selectedDate!.toIso8601String(),
                    );
                  },
                  child: Text("Save Expense"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
