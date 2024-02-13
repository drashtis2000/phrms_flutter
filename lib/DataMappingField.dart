import 'package:flutter/material.dart';

class DataMappingField extends StatelessWidget {
  static const String id = "Data-Mapping-Field";

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
            Text("Data Mapping"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Data Mapping Form",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Source Field Name"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Target Field Name"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Mapping Expression"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save data mapping
                // You can send the data to a server or store it locally as needed.
                // Provide user feedback after mapping.
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Save Mapping"),
            ),
          ],
        ),
      ),
    );
  }
}
