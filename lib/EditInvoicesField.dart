import 'package:flutter/material.dart';

class EditInvoicesField extends StatefulWidget {
  static const String id = "Edit-Invoice-Field-Screen";

  @override
  _EditInvoicesFieldState createState() => _EditInvoicesFieldState();
}

class _EditInvoicesFieldState extends State<EditInvoicesField> {
  // Add necessary variables and controllers for editing invoices
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when not needed
    invoiceNumberController.dispose();
    customerNameController.dispose();
    amountController.dispose();
    dateController.dispose();
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
              SizedBox(width: 10), // Replace with the desired width
              Text("Edit Invoices"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInvoiceForm(),
              SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInvoiceForm() {
    return Column(
      children: [
        TextField(
          controller: invoiceNumberController,
          decoration: InputDecoration(labelText: "Invoice Number"),
        ),
        TextField(
          controller: customerNameController,
          decoration: InputDecoration(labelText: "Customer Name"),
        ),
        TextField(
          controller: amountController,
          decoration: InputDecoration(labelText: "Amount"),
        ),
        TextField(
          controller: dateController,
          decoration: InputDecoration(labelText: "Date"),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to save the edited invoice
        _saveEditedInvoice();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Save"),
    );
  }

  void _saveEditedInvoice() {
    // Implement the logic to save the edited invoice here
    final editedInvoice = Invoice(
      invoiceNumberController.text,
      customerNameController.text,
      amountController.text,
      dateController.text,
    );

    // You can now use 'editedInvoice' to update your data or perform other actions.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Invoice Saved"),
          content: Text("The invoice has been successfully edited."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class Invoice {
  final String invoiceNumber;
  final String customerName;
  final String amount;
  final String date;

  Invoice(this.invoiceNumber, this.customerName, this.amount, this.date);
}
