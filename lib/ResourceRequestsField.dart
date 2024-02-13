import 'package:flutter/material.dart';

class ResourceRequestsField extends StatefulWidget {
  static const String id = "Resource-Requests-Field";

  // Simulated list of resource requests (replace with your data)
  final List<String> resourceRequests = [
    "Resource Request 1",
    "Resource Request 2",
    "Resource Request 3",
  ];

  @override
  _ResourceRequestsFieldState createState() => _ResourceRequestsFieldState();
}

class _ResourceRequestsFieldState extends State<ResourceRequestsField> {
  // Function to remove a resource request
  void _removeRequest(int index) {
    setState(() {
      widget.resourceRequests.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Resource Requests"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                "Resource Requests",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.resourceRequests.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.resourceRequests[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Remove the resource request when the delete icon is pressed
                          _removeRequest(index);
                        },
                      ),
                      // Add more details or actions related to each resource request.
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement logic to add new resource requests
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newRequest = '';

              return AlertDialog(
                title: Text("New Resource Request"),
                content: TextFormField(
                  decoration: InputDecoration(labelText: "Resource Request"),
                  onChanged: (value) {
                    newRequest = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("Submit"),
                    onPressed: () {
                      // Handle the submission of the resource request here
                      if (newRequest.isNotEmpty) {
                        setState(() {
                          widget.resourceRequests.add(newRequest);
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
