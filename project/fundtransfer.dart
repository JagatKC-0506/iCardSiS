import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: FundTransferPage(),
    ));

class FundTransferPage extends StatefulWidget {
  @override
  _FundTransferPageState createState() => _FundTransferPageState();
}

class _FundTransferPageState extends State<FundTransferPage> {
  final _phoneController = TextEditingController();
  final _amountController = TextEditingController();
  final _purposeController = TextEditingController();
  bool _isPhoneValid = true;

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
        title: Text('Fund Transfer'),
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
              'Fund Transfer Form',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number linked with KU ID Card',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('+977'),
                    ],
                  ),
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isPhoneValid ? Colors.green : Colors.red,
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  _isPhoneValid = value.length == 10;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _purposeController,
              decoration: InputDecoration(
                labelText: 'Purpose',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isPhoneValid
                  ? () {
                      // Add your transfer logic here
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Transfer Successful'),
                            content: Text(
                                'The funds have been transferred successfully.'),
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
                    }
                  : null,
              child: Text('Transfer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _amountController.dispose();
    _purposeController.dispose();
    super.dispose();
  }
}
