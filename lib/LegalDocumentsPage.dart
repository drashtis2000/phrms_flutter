import 'package:flutter/material.dart';

class LegalDocumentsPage extends StatelessWidget {
  static const String id = "LegalDocumentsPage";

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
            SizedBox(width: 10),
            Text("Legal Documents"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Legal Documents',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildDocumentItem("Employee Contract", "Sample employee contract template."),
            _buildDocumentItem("Privacy Policy", "Our company's privacy policy."),
            _buildDocumentItem("Terms of Service", "Terms of service for using our platform."),
            // Add more legal documents as needed
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentItem(String title, String description) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward), // Customize the trailing icon as needed
        onTap: () {
          // Handle tapping on a legal document (e.g., open the document)
          // You can implement logic to open documents here.
        },
      ),
    );
  }
}
