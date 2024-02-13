import 'package:flutter/material.dart';
import 'package:phrms/CreateInvoiceField.dart';
import 'package:phrms/EditInvoicesField.dart';
import 'package:phrms/ViewInvoiceField.dart';

class InvoiceItem {
  final String title;
  final String identifier;

  InvoiceItem(this.title, this.identifier);
}

List<InvoiceItem> InvoiceItems = [
  InvoiceItem("Create Invoice", "create_invoice"),
  InvoiceItem("View Invoice", "view_invoice"),
  InvoiceItem("Edit Invoice", "edit_invoice"),
];

class InvoiceManagement extends StatelessWidget {
  static const String id = "Invoice-Management-Screen";

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
            Text("Invoice Management"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Create Invoice",
                  description: "Description of Resource Allocation...",
                  identifier: "create_invoice",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "View Invoice",
                  description: "Description of Resource Tracking...",
                  identifier: "view_invoice",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Edit Invoice",
                  description: "Description of Resource Requests...",
                  identifier: "edit_invoice",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldBox(BuildContext context, {required String title, required String description, required String identifier}) {
    return GestureDetector(
      onTap: () {
        if (identifier == "create_invoice") {
          Navigator.pushNamed(context, CreateInvoiceField.id);
        } else if (identifier == "view_invoice") {
          Navigator.pushNamed(context, ViewInvoiceField.id);
        } else if (identifier == "edit_invoice") {
          Navigator.pushNamed(context, EditInvoicesField.id);
        }  else {
          // Handle other resource management sub-modules' navigation
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


