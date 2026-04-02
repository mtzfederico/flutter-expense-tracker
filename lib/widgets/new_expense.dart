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
  final formatter = DateFormat('MMMM d y hh:mm a');
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    selectedDate = null;
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    final TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedDate == null || selectedTime == null) {
      print("date or time is null");
      return;
    }

    setState(() {
      selectedDate = DateTime(
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

          TextField(
            controller: _amountController,
            maxLength: 10,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: '\$',
              label: Text("Amount"),
            ),
          ),

          /*
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(label: Text("Date")),
          ),*/
          OutlinedButton(
            onPressed: _selectDate,
            child: selectedDate == null
                ? const Text('Select Date')
                : Text(formatter.format(selectedDate!)),
          ),

          Center(
            child: Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Cancel")),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                    print(
                      selectedDate == null
                          ? "Date is null"
                          : selectedDate!.toIso8601String(),
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
