import 'package:flutter/material.dart';
import '../HomePage/home-main.dart';
import '../WalletPage/wallet-main.dart';
import '../ProfilePage/profile-main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/*
    Description:
    - MetricsMain is the main page for the metrics page
    - Shows user earnings with graph
    - Shows vaults accounts with graph
    - Shows earnings increase/decrease percentage

 */

/*
    TODO:
    - UI Layout
    - SnackBar Navigation (Wallet, Metrics, Profile)
    ...

 */

//Temporary class to help create graph

class SavingsData {
  final DateTime date;
  final double amount;

  SavingsData(this.date, this.amount);
}

final List<SavingsData> sampleSavingsData = [
  SavingsData(DateTime(2023, 1, 1), 100),
  SavingsData(DateTime(2023, 2, 1), 200),
  SavingsData(DateTime(2023, 3, 1), 350),
];

class MetricsMain extends StatelessWidget {
  const MetricsMain({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Metrics Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Savings Visualizations",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Floating widget card for Line Chart
            _buildFloatingCard(
              title: "Savings Growth (Line Chart)",
              child: _buildLineChart(sampleSavingsData),
            ),
          ],
        ),
      ),
    );
  }

  // Floating widget card builder
  Widget _buildFloatingCard({required String title, required Widget child}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 200, child: child), // Set a fixed height for charts
          ],
        ),
      ),
    );
  }

  // Line Chart
  Widget _buildLineChart(List<SavingsData> data) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      primaryYAxis: NumericAxis(),
      series: <ChartSeries>[
        LineSeries<SavingsData, DateTime>(
          dataSource: data,
          xValueMapper: (SavingsData data, _) => data.date,
          yValueMapper: (SavingsData data, _) => data.amount,
        ),
      ],
    );
  }

}