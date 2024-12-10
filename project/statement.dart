import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: StatementPage(),
    ));

class StatementPage extends StatelessWidget {
  const StatementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton<String>(
          onSelected: (String result) {
            switch (result) {
              case 'Home':
                // Navigate to Home
                break;
              case 'Settings':
                // Navigate to Settings
                break;
              case 'Contact Us':
                // Navigate to Contact Us
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Home',
              child: Text('Home'),
            ),
            const PopupMenuItem<String>(
              value: 'Settings',
              child: Text('Settings'),
            ),
            const PopupMenuItem<String>(
              value: 'Contact Us',
              child: Text('Contact Us'),
            ),
          ],
          icon: Icon(Icons.menu),
        ),
        title: Text('Statement Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Add your profile navigation logic here
            },
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(transaction['description']!),
                      subtitle: Text(transaction['date']!),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Amount: ${transaction['amount']}',
                            style: TextStyle(
                              color: transaction['amount']!.startsWith('-')
                                  ? Colors.red
                                  : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Balance: ${transaction['balance']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> transactions = [
  {
    'date': '2024-11-15',
    'description': 'Mobile Recharge',
    'amount': '-200',
    'balance': '8000',
  },
  {
    'date': '2024-11-14',
    'description': 'Bill Payment',
    'amount': '-500',
    'balance': '8200',
  },
  {
    'date': '2024-11-13',
    'description': 'Library Fine',
    'amount': '-50',
    'balance': '8700',
  },
  {
    'date': '2024-11-12',
    'description': 'Fund Transfer',
    'amount': '1000',
    'balance': '8750',
  },
];
