import 'package:flutter/material.dart';

// Define a class to represent communication items
class CommunicationItem {
  final String sender;
  final DateTime date;
  final String content;

  CommunicationItem({
    required this.sender,
    required this.date,
    required this.content,
  });
}

class CommunicationPageR extends StatefulWidget {
  static const String id = "CommunicationPage";

  @override
  _CommunicationPageState createState() => _CommunicationPageState();
}

class _CommunicationPageState extends State<CommunicationPageR> {
  // List to store communication items
  List<CommunicationItem> communicationItems = [
    CommunicationItem(
      sender: 'Drashti Satvara',
      date: DateTime(2023, 9, 15),
      content: 'Hello, how are you?',
    ),
    CommunicationItem(
      sender: 'MjM America',
      date: DateTime(2023, 9, 16),
      content: 'I\'m doing well, thank you!',
    ),
    // Add more communication items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Image.asset(
                'assets/images/microsoftteamsimage.png',
                width: 40,
              ),
              SizedBox(width: 10), // Replace with the desired width
              Text("Communication"),
            ],
          ),
      ),
      body: ListView.builder(
        itemCount: communicationItems.length,
        itemBuilder: (context, index) {
          final item = communicationItems[index];

          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(item.sender),
              subtitle: Text(
                '${item.date.toLocal()}',
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle item tap, e.g., navigate to a details page
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement navigation or actions for creating new communication items
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
