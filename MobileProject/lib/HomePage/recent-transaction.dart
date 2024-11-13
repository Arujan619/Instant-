import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
TODO:
- UI Layout
- Recent Transactions are displayed in a draggable sheet
- Each transaction is a ListTile
-Populate with data


 */



class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> transactions = [
      {
        'type': 'Deposited',
        'amount': 100.01,
        'date': DateTime.now(),
        'time': '3:24pm',
      },
      {
        'type': 'Withdrawn',
        'amount': -100.00,
        'date': DateTime.now(),
        'time': '4:15pm',
      },
      // Add more transactions here
    ];

    String formattedDate = DateFormat('d MMMM, yyyy').format(DateTime.now());

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xFF111735),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    // Icon
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // Title (current day)
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: transactions.length,
                        itemBuilder: (BuildContext context, int index) {
                          var transaction = transactions[index];
                          String formattedDate = DateFormat('MMMM d, yyyy').format(transaction['date']);
                          return ListTile(
                            // Transaction type Icon
                            leading: Icon(
                              transaction['type'] == 'Deposited' ? Icons.arrow_downward : Icons.arrow_upward,
                              color: Colors.white,
                            ),
                            // Trasaction type Text
                            title: Text(
                              transaction['type'],
                              style: const TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            // Transaction date
                            subtitle: Text(
                              formattedDate,
                              style: const TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // Transaction amount
                                Text(
                                  transaction['amount'] > 0 ? '+\$${transaction['amount']}' : '-\$${transaction['amount'].abs()}',
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                ),
                                // Transaction time
                                Text(
                                  transaction['time'],
                                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}