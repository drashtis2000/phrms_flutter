import 'package:flutter/material.dart';

class CreateInvoiceField extends StatefulWidget {
  static const String id = "Create-Invoice-Field-Screen";

  @override
  _CreateInvoiceFieldState createState() => _CreateInvoiceFieldState();
}

class _CreateInvoiceFieldState extends State<CreateInvoiceField> {
  final TextEditingController _invoiceTitleController = TextEditingController();
  final TextEditingController _invoiceAmountController = TextEditingController();
  final TextEditingController _invoiceDescriptionController = TextEditingController();

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
            Text("Create Invoice"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                controller: _invoiceTitleController,
                label: "Invoice Title",
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _invoiceAmountController,
                label: "Invoice Amount",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _invoiceDescriptionController,
                label: "Invoice Description",
                maxLines: 4,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createInvoice,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text("Create Invoice"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  void _createInvoice() {
    // Implement the logic to create the invoice here
    final String title = _invoiceTitleController.text;
    final double amount = double.tryParse(_invoiceAmountController.text) ?? 0.0;
    final String description = _invoiceDescriptionController.text;

    // You can now use the title, amount, and description to create the invoice
    // For example, you can send this data to an API or store it locally.
  }

  @override
  void dispose() {
    _invoiceTitleController.dispose();
    _invoiceAmountController.dispose();
    _invoiceDescriptionController.dispose();
    super.dispose();
  }
}
