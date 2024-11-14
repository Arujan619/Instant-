import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'overall-chart.dart';

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const SizedBox(height: 100),
                  // Floating widget card for Line Chart
                  buildFloatingCard(
                    title: "Your earnings",
                    child: buildAreaChart(sampleSavingsData),
                  ),
                ],
              ),
            ),
            // Title
            Positioned(
              top: 0,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Metrics',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    'Instant+',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}