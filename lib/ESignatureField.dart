import 'package:flutter/material.dart';

class ESignatureField extends StatefulWidget {
  static const String id = "ESignatureField";

  @override
  _ESignatureFieldState createState() => _ESignatureFieldState();
}

class _ESignatureFieldState extends State<ESignatureField> {
  List<String> documentsToSign = [
    "Document 1",
    "Document 2",
    "Document 3",
  ];

  String selectedDocument = "Document 1";

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
            Text("Document Signing"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Document Signing',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildDocumentList(),
            SizedBox(height: 16.0),
            _buildSignatureField(),
            SizedBox(height: 16.0),
            _buildSignButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Documents to Sign:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        DropdownButton<String>(
          value: selectedDocument,
          onChanged: (value) {
            setState(() {
              selectedDocument = value!;
            });
          },
          items: documentsToSign.map((String document) {
            return DropdownMenuItem<String>(
              value: document,
              child: Text(document),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSignatureField() {
    // Replace this with a signature capture field widget or package (e.g., signature_pad)
    // Example: https://pub.dev/packages/signature_pad

    // For demonstration purposes, we use a simple Text field.
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Your Signature',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSignButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to save the signature to the selected document
        _saveSignature(selectedDocument);
      },
      child: Text('Sign Document'),
    );
  }

  void _saveSignature(String documentName) {
    // Add logic to save the user's signature to the selected document
    // You can implement this logic based on your specific requirements and data storage methods.
    // For simplicity, we just print a message here.
    print('Signature saved for $documentName');
  }
}
