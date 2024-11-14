import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

// Temporary class to help create graph with data points
class VaultsData {
  final DateTime date;
  final double amount;
  final String category;

  VaultsData(this.date, this.amount, this.category);
}

final List<VaultsData> sampleVaultsData = [
  VaultsData(DateTime(2023, 1, 1), 100, 'School Trip'),
  VaultsData(DateTime(2023, 1, 1), 200, 'Vacation'),
  VaultsData(DateTime(2023, 2, 1), 150, 'School Trip'),
  VaultsData(DateTime(2023, 2, 1), 250, 'Vacation'),
  VaultsData(DateTime(2023, 3, 1), 200, 'School Trip'),
  VaultsData(DateTime(2023, 3, 1), 300, 'Vacation'),
  // Add more data points as needed
];

// Floating widget card builder
Widget buildFloatingCardVault({required String title, required Widget child}) {
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
            buildLegend(),
          ],
        ),
      ),
    ),
  );
}

// Line Chart
Widget buildLineChartVault(List<VaultsData> data) {
  return SfCartesianChart(
    plotAreaBorderColor: Colors.transparent,
    primaryXAxis: DateTimeAxis(
      intervalType: DateTimeIntervalType.days,
      dateFormat: DateFormat('EEE'),
    ),
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
      LineSeries<VaultsData, DateTime>(
        dataSource: data.where((d) => d.category == 'School Trip').toList(),
        xValueMapper: (VaultsData data, _) => data.date,
        yValueMapper: (VaultsData data, _) => data.amount,
        color: Colors.pink,
        width: 2,
      ),
      LineSeries<VaultsData, DateTime>(
        dataSource: data.where((d) => d.category == 'Vacation').toList(),
        xValueMapper: (VaultsData data, _) => data.date,
        yValueMapper: (VaultsData data, _) => data.amount,
        color: Colors.blue,
        width: 2,
      ),
      // Add more LineSeries for other categories if needed
    ],
  );
}

// Legend builder
Widget buildLegend() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: const [
          Icon(Icons.arrow_right, color: Colors.pink),
          Text('School Trip', style: TextStyle(color: Colors.white)),
        ],
      ),
      const SizedBox(width: 10),
      Row(
        children: const [
          Icon(Icons.arrow_right, color: Colors.blue),
          Text('Vacation', style: TextStyle(color: Colors.white)),
        ],
      ),
      // Add more legend items for other categories if needed
    ],
  );
}