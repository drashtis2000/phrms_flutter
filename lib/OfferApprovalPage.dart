import 'package:flutter/material.dart';

class OfferApprovalPage extends StatelessWidget {
  static const String id = "Offer-Approval-Page";

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
            children: [
              Text(
                "Pending Offers",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildOfferCard(context, "Offer 1"),
              _buildOfferCard(context, "Offer 2"),
              // Add more offer cards as needed
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildOfferCard(BuildContext context, String offerTitle) {
  return Card(
    elevation: 3,
    child: ListTile(
      title: Text(offerTitle),
      subtitle: Text("Offer details..."),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              _approveOffer(context, offerTitle);
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: Text("Approve"),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              _rejectOffer(context, offerTitle);
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: Text("Reject"),
          ),
        ],
      ),
    ),
  );
}

void _approveOffer(BuildContext context, String offerTitle) {
  // TODO: Implement offer approval logic
  // Update offer status to approved in the backend

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Offer "$offerTitle" Approved')),
  );
}

void _rejectOffer(BuildContext context, String offerTitle) {
  // TODO: Implement offer rejection logic
  // Update offer status to rejected in the backend

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Offer "$offerTitle" Rejected')),
  );
}
