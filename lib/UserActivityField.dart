import 'package:flutter/material.dart';

class UserActivityField extends StatelessWidget {
  static const String id = "User-Activity-Field-Screen";

  // Sample list of user activities (replace with your actual data)
  final List<UserActivity> userActivities = [
    UserActivity("MJM America", "Logged in", "2023-09-01 10:00 AM"),
    UserActivity("PHRMS", "Created a post", "2023-09-02 3:30 PM"),
    // Add more user activities as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/microsoftteamsimage.png',
              width: 40,
            ),
            SizedBox(width: 10), // Replace with the desired width
            Text("User Activity"),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Recent User Activity",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildUserActivityList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserActivityList() {
    return Column(
      children: userActivities.map((activity) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(activity.userName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity.action),
                Text(
                  "Timestamp: ${activity.timestamp}",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class UserActivity {
  final String userName;
  final String action;
  final String timestamp;

  UserActivity(this.userName, this.action, this.timestamp);
}
