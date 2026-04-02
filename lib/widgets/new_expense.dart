import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();

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
          maxLength: 50,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(label: Text("Amount")),
        ),
        TextField(
          maxLength: 50,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(label: Text("Date")),
        ),

        ElevatedButton(onPressed: (){
          print(_titleController.text);
        }, child: Text("Save Expense")),
        
      ],
    ));
  }
}