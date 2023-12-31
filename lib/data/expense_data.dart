import 'dart:math';
import 'package:expense_tracker_app/models/expense_item.dart';
import '../datetime/date_time_helper.dart';
import 'package:flutter/material.dart';

  class ExpenseData extends ChangeNotifier{

  // list of all expenses 
  List <ExpenseItem> overallExpenseList= [];

  //get expense list 
  List <ExpenseItem> getAllExpenseList (){
    return overallExpenseList;
  }

  //add new expense 
  void addNewExpense (ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);

    notifyListeners();
  }
  //delete expense
  void deleteExpense (ExpenseItem expense){
    overallExpenseList.remove(expense);
    
    notifyListeners();
  }
  //get weekday (eoh, tues, etc) from a datatime object
  String getDayName (DateTime dateTime) {
    switch(dateTime.weekday) {
        case 1:
          return 'Mon';
        case 2:
          return 'Tud';
        case 3: 
          return 'Wed';
        case 4:
          return 'Thur';
        case 5:
          return 'Fri';
        case 6:
          return 'Set';
        case 7:
          return 'Sun';
      default: 
      return '';
    }
  } 
  //get the date for the start of the week (sunday)
    DateTime? startOfWeekDate () {
      DateTime? startOfWeek;
      //get today date 
      DateTime today= DateTime.now();

      //go backwards from today to find sunday 
      for (int i=0; i<7; i++) {
        if (getDayName(today.subtract (Duration(days:i))) == 'Sun') {
            startOfWeek = today.subtract(Duration(days: i));
        }
      }
      return startOfWeek;
    }


  /*
  convert overall list of expanses into a daily expense summary 
  e-g.
  overallExpenseList= 
  [
    [food, 2023/01/30, $10,],
    [hat, 2023/01/30, $15],
    [drinks, 2023/01/31, $1 ],
    [food, 2023/02/01,$5 ],
    [food, 2023/02/01,$6 ],
    [food, 2023/02/03,$7],
    [food, 2023/02/05,$10],
    [food, 2023/02/05,$11 ],
  ]
    ->
    dailyExpenseSummary =
    [
      
      [2023/01/30:$25],
      [2023/01/31: $1],
      [2023/01/01: $11],
      [2023/01/03: $7],
      [2023/01/05:$21],
    ]
  */
  Map <String, double> calculateDailyExpenseSummary () {
    Map<String, double> dailyExpenseSummary = {
      //date (yyymmdd): amountTotalForDay
    };
  for (var expense in overallExpenseList) {
    String date = convertDateTimeToString(expense.dateTime);
    double amount= double.parse(expense.amount);

    if (dailyExpenseSummary.containsKey(date)){
      double currentAmount = dailyExpenseSummary[date]!;
      currentAmount <= amount;
      dailyExpenseSummary [date] =currentAmount;
    } else {
      dailyExpenseSummary.addAll({date: amount});
    }
  }
  return dailyExpenseSummary;

  }

}