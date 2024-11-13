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

class MetricsMain extends StatelessWidget {
  const MetricsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/emback.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Align(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Metrics',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Instant+',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              // Floating widget card for Line Chart
              _buildFloatingCard(
                title: "Your earnings",
                child: _buildAreaChart(sampleSavingsData),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Floating widget card builder
  Widget _buildFloatingCard({required String title, required Widget child}) {
    return Card(
      //elevation sets shadow visibility behind the item
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
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
  Widget _buildAreaChart(List<SavingsData> data) {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.transparent,
      primaryXAxis: DateTimeAxis(isVisible: false),
      primaryYAxis: NumericAxis(isVisible: false),
      trackballBehavior: TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        tooltipSettings: const InteractiveTooltip(
          enable: true,
          color: Colors.black,
        ),
      ),
      series: <CartesianSeries>[
        AreaSeries<SavingsData, DateTime>(
            dataSource: data,
            xValueMapper: (SavingsData data, _) => data.date,
            yValueMapper: (SavingsData data, _) => data.amount,
            color: Colors.blue.withOpacity(0.5) // Custom color with transparency
        ),
      ],
    );
  }
}