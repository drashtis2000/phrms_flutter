import 'package:flutter/material.dart';

class OfferExtensionPage extends StatefulWidget {
  static const String id = "Offer-Extension-Page";

  @override
  _OfferExtensionPageState createState() => _OfferExtensionPageState();
}

class _OfferExtensionPageState extends State<OfferExtensionPage> {
  TextEditingController _offerDetailsController = TextEditingController();
  TextEditingController _extensionPeriodController = TextEditingController();

  @override
  void dispose() {
    _offerDetailsController.dispose();
    _extensionPeriodController.dispose();
    super.dispose();
  }
  void _submitExtensionRequest(BuildContext context) {
    String offerDetails = _offerDetailsController.text;
    int extensionPeriod = int.tryParse(_extensionPeriodController.text) ?? 0;

    // TODO: Implement offer extension request logic

    // Implement the logic to submit the extension request to the backend

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Extension request submitted")),
    );

    _offerDetailsController.clear();
    _extensionPeriodController.clear();
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
              Text("Offer Approval"),
            ],
          )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _offerDetailsController,
                decoration: InputDecoration(labelText: "Offer Details"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _extensionPeriodController,
                decoration: InputDecoration(labelText: "Extension Period (days)"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _submitExtensionRequest(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Text("Request Extension"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

