import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  static const String id = "NotificationsPage";

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class NotificationItem {
  final String title;
  final String message;
  final String timestamp;

  NotificationItem(this.title, this.message, this.timestamp);
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Sample list of notifications (you can replace this with your data)
  List<NotificationItem> notifications = [
    NotificationItem(
      'New Announcement',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      '2 hours ago',
    ),
    NotificationItem(
      'Meeting Reminder',
      'You have a team meeting at 3:00 PM today.',
      'Yesterday',
    ),
    NotificationItem(
      'Task Assignment',
      'You have been assigned a new task for this week.',
      '3 days ago',
    ),
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
            SizedBox(width: 10),
            Text("Notifications"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  NotificationItem notification = notifications[index];
                  return _buildNotificationCard(notification);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(notification.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.message),
            SizedBox(height: 8.0),
            Text(
              'Timestamp: ${notification.timestamp}',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward), // Customize the trailing icon as needed
        onTap: () {
          // Handle tapping on a notification (e.g., navigate to notification details)
          navigateToNotificationDetails(context, notification);
        },
      ),
    );
  }

  void navigateToNotificationDetails(BuildContext context, NotificationItem notification) {
    // Implement your logic for displaying notification details
    // You can create a separate NotificationDetails page for this.
    // Example: Navigator.pushNamed(context, NotificationDetails.id);
  }
}
