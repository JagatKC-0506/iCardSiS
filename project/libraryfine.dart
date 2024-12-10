import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      home: LibraryPage(),
    ));

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  List<Book> books = [
    Book(
        title: 'Flutter for Beginners',
        borrowDate: DateTime.now().subtract(Duration(days: 20)),
        returnDate: DateTime.now().add(Duration(days: 10))),
    Book(
        title: 'Advanced Dart Programming',
        borrowDate: DateTime.now().subtract(Duration(days: 25)),
        returnDate: DateTime.now().subtract(Duration(days: 5))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Books'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          Book book = books[index];
          int daysLeft = book.returnDate.difference(DateTime.now()).inDays;
          bool isDue = daysLeft < 0;
          int fine = isDue ? daysLeft.abs() * 7 : 0;

          return Card(
            child: ListTile(
              title: Text(book.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Borrowed: ${DateFormat('yyyy-MM-dd').format(book.borrowDate)}'),
                  Text(
                      'Due: ${DateFormat('yyyy-MM-dd').format(book.returnDate)}'),
                  Text(
                      'Days left: ${daysLeft > 0 ? daysLeft : 'Overdue by ${daysLeft.abs()} days'}'),
                  if (isDue)
                    Text('Fine: ₹$fine', style: TextStyle(color: Colors.red)),
                ],
              ),
              trailing: Wrap(
                spacing: 12,
                children: [
                  if (isDue)
                    ElevatedButton(
                      onPressed: () {
                        // Add logic to pay the fine
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Payment Successful'),
                              content: Text('Fine paid successfully.'),
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
                      },
                      child: Text('Pay Fine'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  if (!book.isRenewed)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          book.returnDate =
                              book.returnDate.add(Duration(days: 15));
                          book.isRenewed = true;
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Renewal Successful'),
                              content:
                                  Text('Book return date extended by 15 days.'),
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
                      },
                      child: Text('Renew'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Book {
  String title;
  DateTime borrowDate;
  DateTime returnDate;
  bool isRenewed;

  Book({
    required this.title,
    required this.borrowDate,
    required this.returnDate,
    this.isRenewed = false,
  });
}
