import 'package:flutter/material.dart';
import 'package:phrms/FeedBackPage.dart';
import 'CompanyResourcesPage.dart';

class OnBoardingField extends StatefulWidget {
  static const String id = "OnBoardingField";

  @override
  _OnBoardingFieldState createState() =>
      _OnBoardingFieldState();
}

class _OnBoardingFieldState extends State<OnBoardingField> {
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
              Text("OnBoarding"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Our Organization!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Orientation Checklist:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            _buildOrientationItem('Company Mission and Values'),
            _buildOrientationItem('Employee Handbook'),
            _buildOrientationItem('HR Policies'),
            _buildOrientationItem('Team Introduction'),
            SizedBox(height: 16.0),
            Text(
              'Next Steps:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Please complete the orientation checklist above.'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement action for completing orientation
                // You can navigate to the next step or perform any other action here.
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Complete Orientation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CompanyResourcesPage.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Company Resources'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, FeedbackPage.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Feedback and Continuous Improvement'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrientationItem(String itemName) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green),
        SizedBox(width: 8.0),
        Text(itemName),
      ],
    );
  }
}
