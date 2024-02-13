import 'package:flutter/material.dart';

class CompanyResourcesPage extends StatefulWidget {
  static const String id = "CompanyResourcesPage";

  @override
  _CompanyResourcesPageState createState() => _CompanyResourcesPageState();
}

class _CompanyResourcesPageState extends State<CompanyResourcesPage> {
  // Add your state variables and logic for company resources here

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
              Text("Company Resources"),
            ],
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Our Company Resources',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildResourceItem(
              'Employee Handbook',
              'Access our comprehensive employee handbook.',
            ),
            _buildResourceItem(
              'Benefits Guide',
              'Learn about our employee benefits and wellness programs.',
            ),
            _buildResourceItem(
              'Training and Development',
              'Discover training programs and development opportunities.',
            ),
            // Add more resource items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildResourceItem(String itemName, String itemDescription) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: ListTile(
        title: Text(itemName),
        subtitle: Text(itemDescription),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Implement action when a resource item is tapped
          // You can navigate to a specific resource or perform any other action.
        },
      ),
    );
  }
}
