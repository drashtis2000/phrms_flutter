import 'package:flutter/material.dart';
import 'package:phrms/DocumentationPage.dart';
import 'package:phrms/OfferApprovalPage.dart';
import 'package:phrms/OfferExtensionPage.dart';

class MakingOfferField extends StatelessWidget {
  static const String id = "Making-Offer-Field";

  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _benefitsController = TextEditingController();
  final TextEditingController _responsibilityController = TextEditingController();

  void _submitOffer(BuildContext context) {
    final offerData = {
      'salary': _salaryController.text,
      'benefits': _benefitsController.text,
      'responsibility': _responsibilityController,
      // ... add more fields ...
    };

    // TODO: Save offer data to Firestore or your backend
    // Example: FirebaseFirestore.instance.collection('offers').add(offerData);

    _salaryController.clear();
    _benefitsController.clear();
    _responsibilityController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Offer Created Successfully')),
    );
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
              Text("Making Offer"),
            ],
          )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Salary'),
                controller: _salaryController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Benefits'),
                controller: _benefitsController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Job Responsibility'),
                controller: _responsibilityController,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Submit offer form
                  _submitOffer(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Create Offer'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OfferApprovalPage.id);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Offer Approval'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OfferExtensionPage.id);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Offer Extension'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, DocumentationPage.id);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Documentation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
