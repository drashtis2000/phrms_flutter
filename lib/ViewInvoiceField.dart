import 'package:flutter/material.dart';

class ViewInvoiceField extends StatelessWidget {
  static const String id = "View-Invoice-Field-Screen";

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
              Text("View Invoices"),
            ],
          )
      ),
      body: InvoiceList(),
    );
  }
}

class InvoiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample list of invoices (replace with your actual data)
    final List<Invoice> invoices = [
      Invoice("INV-001", "MJM America", "\$500.00", "2023-09-01"),
      Invoice("INV-002", "Drashti", "\$300.00", "2023-09-02"),
      // Add more invoices as needed
    ];

    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        final invoice = invoices[index];
        return ListTile(
          title: Text("Invoice ${invoice.number}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Customer: ${invoice.customerName}"),
              Text("Amount: ${invoice.amount}"),
              Text("Date: ${invoice.date}"),
            ],
          ),
          onTap: () {
            _viewInvoiceDetails(context, invoice);
          },
        );
      },
    );
  }

  void _viewInvoiceDetails(BuildContext context, Invoice invoice) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Invoice Details"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Invoice Number: ${invoice.number}"),
              Text("Customer Name: ${invoice.customerName}"),
              Text("Amount: ${invoice.amount}"),
              Text("Date: ${invoice.date}"),
              // Add more details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

class Invoice {
  final String number;
  final String customerName;
  final String amount;
  final String date;

  Invoice(this.number, this.customerName, this.amount, this.date);
}

