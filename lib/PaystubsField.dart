import 'package:flutter/material.dart';

class PaystubsField extends StatelessWidget {
  static const String id = "PaystubsField";

  // Dummy data for pay stubs (you should replace this with actual data)
  final List<PayStub> payStubs = [
    PayStub("January 2023", "Download"),
    PayStub("December 2022", "Download"),
    PayStub("November 2022", "Download"),
    // Add more pay stubs as needed
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
            SizedBox(width: 10), // Replace with the desired width
            Text("Pay Stub Listings"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pay Stub Listings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Add UI elements related to pay stub listings
              Expanded(
                child: ListView.builder(
                  itemCount: payStubs.length,
                  itemBuilder: (context, index) {
                    final payStub = payStubs[index];
                    return ListTile(
                      title: Text(payStub.period),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Implement logic to download the pay stub
                          // You can provide a download link or perform the download action here
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        child: Text(payStub.action),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PayStub {
  final String period;
  final String action;

  PayStub(this.period, this.action);
}
