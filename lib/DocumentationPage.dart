import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DocumentationPage extends StatefulWidget {
  static const String id = "Documentation-Page";

  @override
  _DocumentationPageState createState() => _DocumentationPageState();
}

class _DocumentationPageState extends State<DocumentationPage> {
  TextEditingController _documentNameController = TextEditingController();

  @override
  void dispose() {
    _documentNameController.dispose();
    super.dispose();
  }

  Future<void> _uploadDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      // Upload the file to your backend or storage service
      print("File path: ${file.path}");
    } else {
      // User canceled the file picker
    }
  }

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
              Text("Documentation"),
            ],
          )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Documentation Management",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _documentNameController,
                decoration: InputDecoration(
                  labelText: "Document Name",
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _uploadDocument,
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text("Upload Document"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
