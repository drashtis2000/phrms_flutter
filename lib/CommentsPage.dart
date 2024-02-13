import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  static const String id = "CommentsPage";

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  TextEditingController commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Comments and Feedback"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Comments and Feedback",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: commentsController,
              maxLines: 5, // Allowing multiple lines for comments
              decoration: InputDecoration(
                labelText: "Enter Comments and Feedback",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement code to save the entered comments and feedback
                final comments = commentsController.text.trim();
                if (comments.isNotEmpty) {
                  // You can save the comments and perform any necessary actions here
                  // For example, you can send the feedback to a server or store it locally.
                  // Then, you can show a confirmation message to the user.
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Feedback Submitted"),
                        content: Text("Thank you for your feedback!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Show an error message if the comments field is empty
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Please enter your comments and feedback."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Submit Feedback"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    commentsController.dispose();
    super.dispose();
  }
}
