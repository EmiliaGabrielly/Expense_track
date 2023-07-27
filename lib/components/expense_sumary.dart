import 'package:expense_tracker_app/bar%20graph/bar_graph.dart';
import 'package:expense_tracker_app/data/expense_data.dart';
import 'package:expense_tracker_app/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final  DateTime startOfweek;
  const ExpenseSummary({
    super.key,
    required this.startOfweek,
    });

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(startOfweek.add(const Duration(days:0)));       
    String monday = convertDateTimeToString(startOfweek.add(const Duration(days:1)));
    String tuesday = convertDateTimeToString(startOfweek.add(const Duration(days:2)));
    String wednesday = convertDateTimeToString(startOfweek.add(const Duration(days:3)));
    String thursday = convertDateTimeToString(startOfweek.add(const Duration(days:4)));
    String friday = convertDateTimeToString(startOfweek.add(const Duration(days:5)));
    String saturday = convertDateTimeToString(startOfweek.add(const Duration(days:6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MybarGraph(
          maxY: 100,
          sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
          monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
          tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0, 
          wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0, 
          thurAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0, 
          friAmount: value.calculateDailyExpenseSummary()[friday] ?? 0, 
          satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,                
        ),
      ),
    );
  }
}