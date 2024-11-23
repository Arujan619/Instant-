import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Classes/overall.dart';
import '../Classes/vault.dart';
import '../Classes/transaction.dart';

// Temporary class to help create graph with data points
class SavingsData {
  final DateTime date;
  final double amount;

  SavingsData(this.date, this.amount);
}

final List<SavingsData> sampleSavingsData = [
  SavingsData(DateTime(2023, 1, 1), 100),
  SavingsData(DateTime(2023, 2, 1), 350),
  SavingsData(DateTime(2023, 3, 1), 220),
  SavingsData(DateTime(2023, 4, 1), 320),
  SavingsData(DateTime(2023, 5, 1), 350),
  SavingsData(DateTime(2023, 6, 1), 450),
];

// Floating widget card builder
Widget buildFloatingCard({required String title, required Widget child}) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF236AA0), Color(0xFF1C0D3A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                ),
              ],
            ),
            SizedBox(height: 200, child: child), // Set a fixed height for charts
          ],
        ),
      ),
    ),
  );
}

List<Transaction> buildCumulativeTotal(List<Transaction> transactions){
  double total = 0;

  for (var item in transactions){
    if(item.transactionType == "Deposit"){
      total = total + item.getAmount();
    }
    else{
      total = total - item.getAmount();
    }
    item.setAmount(total);
  }

  return transactions;
}

Widget buildAreaChart(List<Transaction> transactions) {
  transactions = buildCumulativeTotal(transactions);
  // print(transactions.map((t) => '${t.getTransactionDate()} - ${t.getAmount()}').toList());

  return SfCartesianChart(
    plotAreaBorderColor: Colors.transparent,
    primaryXAxis: DateTimeAxis(isVisible: true),
    primaryYAxis: NumericAxis(isVisible: true),
    trackballBehavior: TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        color: Colors.black,
      ),
    ),
    series: <CartesianSeries>[
      AreaSeries<Transaction, DateTime>(
        dataSource: transactions,
        xValueMapper: (Transaction transaction, _) => transaction.getTransactionDate(),
        yValueMapper: (Transaction transaction, _) => transaction.getAmount(),
        borderColor: const Color(0xFFF6386B),
        borderWidth: 2,
        gradient: const LinearGradient(
          colors: [
            Color(0xFFF6386B),
            Color(0xDA6185),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    ],
  );
}
