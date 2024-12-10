import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: LoadMoneyPage(),
    ));

class LoadMoneyPage extends StatelessWidget {
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
        title: Text('Load Money'),
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
              'Select an option to load money',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            LoadOptionCard(
              icon: Icons.account_balance,
              label: 'Load from Bank',
              onTap: () {
                // Add logic for loading from bank
              },
            ),
            LoadOptionCard(
              icon: Icons.account_balance_wallet,
              label: 'Load from eSewa',
              onTap: () {
                // Add logic for loading from eSewa
              },
            ),
            LoadOptionCard(
              icon: Icons.account_balance_wallet,
              label: 'Load from Khalti',
              onTap: () {
                // Add logic for loading from Khalti
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoadOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  LoadOptionCard(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 50, color: Colors.green),
        title: Text(label, style: TextStyle(fontSize: 18)),
        onTap: onTap,
      ),
    );
  }
}
