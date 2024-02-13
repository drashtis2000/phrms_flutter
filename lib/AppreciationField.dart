import 'package:flutter/material.dart';

class AppreciationField extends StatefulWidget {
  static const String id = "AppreciationField";

  @override
  _AppreciationFieldState createState() => _AppreciationFieldState();
}

class _AppreciationFieldState extends State<AppreciationField> {
  final TextEditingController appreciationController = TextEditingController();
  String selectedEmployee = "Employee 1";
  List<String> employees = ["Employee 1", "Employee 2", "Employee 3"]; // Replace with your employee list

  @override
  void dispose() {
    appreciationController.dispose();
    super.dispose();
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
            SizedBox(width: 10),
            Text("Employee Recognition"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Recognize an Employee",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedEmployee,
                onChanged: (newValue) {
                  setState(() {
                    selectedEmployee = newValue!;
                  });
                },
                items: employees.map((employee) {
                  return DropdownMenuItem(
                    value: employee,
                    child: Text(employee),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: "Select an Employee",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: appreciationController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Appreciation Message",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement code to submit the appreciation message
                  String message = appreciationController.text;
                  // You can save the message and selected employee's name in your database or handle it as needed.
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text("Submit Appreciation"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
