import 'package:expense_tracker_app/components/expense_sumary.dart';
import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:expense_tracker_app/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker_app/components/expense_tiler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//controllers text
final newExpenseNameController= TextEditingController();
final newExpenseAmountController= TextEditingController();

  var Provider;
  
void addNewExpense () {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title:  Text ('Add new expense'),
      content: Column(
        mainAxisSize:MainAxisSize.min ,
        children: [
          TextField( 
            controller: newExpenseAmountController,
           ),
          TextField(
            controller: newExpenseAmountController,
          ),
        ],
      ),
      actions: [
        MaterialButton(
          onPressed: save, 
          child: Text('Save'),
        ),
        MaterialButton(
          onPressed: cancel, 
          child: Text('cancel'),
        ),
      ],
    ),
  );
}
void save () {
  ExpenseItem newExpense = ExpenseItem (
  name: newExpenseNameController.text, 
  amount: newExpenseAmountController.text, 
  dateTime: DateTime.now(),
  );
  Provider.of<ExpenseData>(context, listen:false).addNewExpense(newExpense);
  Navigator.pop(context);
  clear();
}

void cancel() {
  Navigator.pop(context);
}

//clear controllers 
void clear () {
  newExpenseAmountController.clear();
  newExpenseNameController.clear();
}
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton (
        onPressed: addNewExpense,
        child: Icon(Icons.add),
         ),
         body: ListView(children: [
          //weekly summary 
          ExpenseSummary(startOfweek: value.startOfWeekDate()),


          //expense list
          ListView.builder (
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          itemCount: value.getAllExpenseList().length,

          itemBuilder: (context, index) => ExpenseTile(
            name: value.getAllExpenseList()[index].name,
            amount: value.getAllExpenseList()[index].amount, 
            dateTime: value.getAllExpenseList()[index].dateTime,
          ),    
       ),
     ]),
    ),
   );
  }
}

