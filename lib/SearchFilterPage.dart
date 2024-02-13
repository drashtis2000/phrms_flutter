import 'package:flutter/material.dart';

class SearchFilterPage extends StatelessWidget {
  static const String id = "Search-Filter-Page";

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
            Text("Search & Filter"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Search'),
              ),
              DropdownButton<String>(items: [], onChanged: (String? value) {  },
                // Add dropdown menu options for filtering
                // Example: items, onChanged, value
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Apply search and filtering logic
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Apply Filters'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
