import 'package:flutter/material.dart';

class ExitDocumentationField extends StatelessWidget {
  static const String id = "Exit-Documentation-Screen";

  // Sample list of exit documents (replace with your actual data)
  final List<ExitDocument> exitDocuments = [
    ExitDocument("Exit Document 1", "MJM America", "2023-09-15"),
    ExitDocument("Exit Document 2", "PHRMS", "2023-09-20"),
    // Add more exit documents as needed
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
            SizedBox(width: 10),
            Text("Exit Documentation"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              "List of Exit Documents:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildExitDocumentList(), // Display list of exit documents
          ],
        ),
      ),
    );
  }

  Widget _buildExitDocumentList() {
    return Expanded(
      child: ListView.builder(
        itemCount: exitDocuments.length,
        itemBuilder: (context, index) {
          final document = exitDocuments[index];
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListTile(
              title: Text(document.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Employee: ${document.employeeName}"),
                  Text("Date: ${document.date}"),
                  // Add more details here if needed
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.download), // Example action: Download
                onPressed: () {
                  // Implement your action here, e.g., downloading the document
                  _downloadExitDocument(context, document);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _downloadExitDocument(BuildContext context, ExitDocument document) {
    // Implement the logic to download the selected exit document
    // You can show a download progress or open a document viewer, etc.
    // Replace this with your actual download implementation
    // For now, let's display a snackbar message as an example
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Downloading ${document.name}..."),
      ),
    );
  }
}

class ExitDocument {
  final String name;
  final String employeeName;
  final String date;

  ExitDocument(this.name, this.employeeName, this.date);
}
