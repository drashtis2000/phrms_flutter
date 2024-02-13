import 'package:flutter/material.dart';
import 'package:phrms/CommentsPage.dart';

class RatingField extends StatefulWidget {
  static const String id = "RatingField";

  @override
  _RatingFieldState createState() => _RatingFieldState();
}

class _RatingFieldState extends State<RatingField> {
  List<String> ratingItems = [];
  TextEditingController ratingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the list of rating items (e.g., Poor, Fair, Good, Excellent)
    ratingItems = ['Poor', 'Fair', 'Good', 'Excellent'];
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
            SizedBox(width: 10),
            Text("Rating Scale"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Define Rating Scale",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ratingItems.length,
              itemBuilder: (BuildContext context, int index) {
                final rating = ratingItems[index];
                return ListTile(
                  title: Text(rating),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Remove the rating item when the delete button is pressed
                      setState(() {
                        ratingItems.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: ratingController,
                    decoration: InputDecoration(labelText: "Add Rating Item"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Add a new rating item to the list when the add button is pressed
                    final newRating = ratingController.text.trim();
                    if (newRating.isNotEmpty) {
                      setState(() {
                        ratingItems.add(newRating);
                        ratingController.clear();
                      });
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Application Tracking page
                    Navigator.pushNamed(context, CommentsPage.id);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text('Comments'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    ratingController.dispose();
    super.dispose();
  }
}
