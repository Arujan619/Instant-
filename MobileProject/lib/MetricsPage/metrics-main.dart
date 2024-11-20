import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'overall-chart.dart';
import 'vaults-chart.dart';
import '../Classes/currencyConversion.dart';
import '../Classes/vault.dart';

/*
    Description:
    - MetricsMain is the main page for the metrics page
    - Shows user earnings with graph
    - Shows vaults accounts with graph
    - Shows earnings increase/decrease percentage
 */

/*
    TODO:
    - Integrate Transactions with Vaults so we can display charts based of users->vaults->transactions and more
    - Make charts from class data rather than temp data (class integration)
    ...
 */

class MetricsMain extends StatefulWidget {
  const MetricsMain({super.key});

  @override
  MetricsMainState createState() => MetricsMainState();
}

class MetricsMainState extends State<MetricsMain>{
  String currentCurrency = "CAD";
  String? selectedCurrency;
  CurrencyConversion currencyConverter = CurrencyConversion();

  Vault vault = Vault.parameterized(name: "school", image: Image.asset('assets/profile_picture.png'), 
    daysRemaining: 100, goalAmount: 500, balanceAmount: 100, cardLinkedId: 1234, isLocked: true
  );

  //Change the way we generate this list of currencies, we can grab every currency available from the api 
  final List<String> currencies = [ "USD", "EUR", "GBP", "JPY", "CAD", "AUD", "CHF", "CNY", "INR", "BRL", 
    "ZAR", "RUB", "KRW", "SGD", "MYR"
  ]; 

  void currencyDialog() async{
    selectedCurrency = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Currency'),
          content: SizedBox(
            height: 300,
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: ListBody(
                children:currencies.map((currency){
                  return ListTile(
                    title: Text(currency),
                    onTap:(){
                      Navigator.pop(context, currency);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );

    currentCurrency = selectedCurrency!;
    await currencyConverter.convert(vault, currentCurrency, selectedCurrency!);
    setState((){});
  }

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
                  const SizedBox(height: 20),
                  // Floating widget card for Vaults Chart
                  buildFloatingCardVault(
                    title: "Vaults Accounts",
                    child: buildLineChartVault(sampleVaultsData),
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

            // + ADD Account Button
            Positioned(
              top: 70,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  currencyDialog();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: const Icon(
                        Icons.currency_exchange,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Change Currency',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    //Remove below box once charts are implemented properly because then we can see the charts change on setState
                    const SizedBox(width: 8),
                    Text(
                      vault.getBalanceAmount().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
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

// class MetricsMain extends StatelessWidget {
//   const MetricsMain({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/backgrounds/emback.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//         ),
//         body: Stack(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16.0),
//               child: ListView(
//                 children: [
//                   const SizedBox(height: 100),
//                   // Floating widget card for Line Chart
//                   buildFloatingCard(
//                     title: "Your earnings",
//                     child: buildAreaChart(sampleSavingsData),
//                   ),
//                   const SizedBox(height: 20),
//                   // Floating widget card for Vaults Chart
//                   buildFloatingCardVault(
//                     title: "Vaults Accounts",
//                     child: buildLineChartVault(sampleVaultsData),
//                   ),
//                 ],
//               ),
//             ),
//             // Title
//             Positioned(
//               top: 0,
//               right: 16,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.min,
//                 children: const [
//                   Text(
//                     'Metrics',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontFamily: 'Poppins',
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                   Text(
//                     'Instant+',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontFamily: 'Poppins',
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }