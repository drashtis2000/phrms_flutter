import 'package:flutter/material.dart';

class BenefitsField extends StatelessWidget {
  static const String id = "BenefitsField";

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
            Text("View Benefits Information"),
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
                "View Benefits Information",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Add UI elements related to viewing benefits information
              _buildBenefitCard(
                context,
                title: "Health Insurance",
                description: "Details about health insurance plans.",
              ),
              SizedBox(height: 10),
              _buildBenefitCard(
                context,
                title: "Retirement Plans",
                description: "Information about retirement savings options.",
              ),
              // Add more cards for other benefits as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitCard(BuildContext context, {required String title, required String description}) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
