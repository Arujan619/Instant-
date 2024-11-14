import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class RecentChart extends StatelessWidget {
  const RecentChart({super.key});

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('MMM yyyy').format(DateTime.now());
    String overallBalance = '\$5,321.00';
    String profitOrLoss = '-\$435.35'; // Change this value as needed

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Date: SEP 2021
            Text(
              currentDate,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            // Overall Balance: $5,321.00
            Text(
              overallBalance,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            // Profit/Loss: -$435.35
            Text(
              profitOrLoss,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 40),
            // Chart
            Container(
              height: 200,
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.transparent,
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          );
                          switch (value.toInt()) {
                            case 0:
                              return Text('SEP', style: style);
                            case 1:
                              return Text('OCT', style: style);
                            case 2:
                              return Text('NOV', style: style);
                            case 3:
                              return Text('DEC', style: style);
                            case 4:
                              return Text('JAN', style: style);
                            case 5:
                              return Text('FEB', style: style);
                            case 6:
                              return Text('MAR', style: style);
                            case 7:
                              return Text('APR', style: style);
                            case 8:
                              return Text('MAY', style: style);
                            case 9:
                              return Text('JUN', style: style);
                          }
                          return const Text('');
                        },
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 1.5),
                        FlSpot(2, 1.4),
                        FlSpot(3, 3.4),
                        FlSpot(4, 2),
                        FlSpot(5, 2.2),
                        FlSpot(6, 1.8),
                        FlSpot(7, 2.5),
                        FlSpot(8, 2.0),
                        FlSpot(9, 3.0),
                      ],
                      isCurved: true,
                      color: Colors.black,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}