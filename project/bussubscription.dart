import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: BusSubscriptionPage(),
    ));

class BusSubscriptionPage extends StatefulWidget {
  @override
  _BusSubscriptionPageState createState() => _BusSubscriptionPageState();
}

class _BusSubscriptionPageState extends State<BusSubscriptionPage> {
  String selectedCity = 'Kathmandu';
  int subscriptionAmount = 8000;
  int remainingDays = 0; // Initially zero

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
        title: Text('Bus Subscription'),
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
              'Bus Subscription Form',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: remainingDays / 30,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
            SizedBox(height: 10),
            Text(
              'Remaining time of subscription: $remainingDays days',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedCity,
              decoration: InputDecoration(
                labelText: 'From',
                border: OutlineInputBorder(),
              ),
              items: <String>['Kathmandu', 'Bhaktapur', 'Sanga']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue!;
                  switch (selectedCity) {
                    case 'Kathmandu':
                      subscriptionAmount = 8000;
                      break;
                    case 'Bhaktapur':
                      subscriptionAmount = 5000;
                      break;
                    case 'Sanga':
                      subscriptionAmount = 4000;
                      break;
                  }
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'To (Kathmandu University)',
                border: OutlineInputBorder(),
                enabled: false,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Amount: $subscriptionAmount per month',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                bool transactionSuccess = performSubscriptionTransaction();

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(transactionSuccess ? 'Success' : 'Failure'),
                      content: Text(transactionSuccess
                          ? 'Subscribed successfully.'
                          : 'Subscription failed.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );

                if (transactionSuccess) {
                  setState(() {
                    remainingDays = 30;
                  });
                }
              },
              child: Text('Subscribe'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool performSubscriptionTransaction() {
    // Here you would have the real transaction logic
    // For now, we'll simulate a successful transaction
    return true; // Simulate a successful transaction
  }
}
