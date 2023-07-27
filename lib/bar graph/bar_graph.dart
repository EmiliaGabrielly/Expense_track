import 'package:expense_tracker_app/bar%20graph/bart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MybarGraph extends StatelessWidget {
  final double ? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

   const MybarGraph ({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount, 
    });
  @override
  Widget build(BuildContext context) {

    // inicialize the bar data 
    BarData myBarData= BarData(
     sunAmount: sunAmount,
     monAmount: monAmount,
     tueAmount: tueAmount, 
     wedAmount: wedAmount, 
     thurAmount: thurAmount, 
     friAmount: friAmount, 
     satAmount: satAmount
     );
     myBarData.initializeBarData();
    return BarChart(BarChartData (
        maxY: 100,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false,)),
          leftTitles:AxisTitles(sideTitles: SideTitles(showTitles: false,)),
        
        
    
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),        
        barGroups: myBarData.barData
        .map((data) => BarChartGroupData(
          x: data.x,
          barRods: [
            BarChartRodData(
              toY: data.y,
              color: Colors.grey[300],
              width: 25,
              borderRadius: BorderRadius.circular(4),
              backDrawRodData: BackgroundBarChartRodData (
                show:true,
                toY: maxY,
                color: Colors.grey[300],
                 ),
            
              ),
          ],
        ), 
        ), 
            
          ),
        );
        .toList(),
      
  }
}