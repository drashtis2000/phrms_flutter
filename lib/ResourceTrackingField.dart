import 'package:flutter/material.dart';

class ResourceTrackingField extends StatefulWidget {
  static const String id = "Resource-Tracking-Field";

  // Simulated list of allocated resources (replace with your data)
  final List<String> allocatedResources = [
    "Resource 1",
    "Resource 2",
    "Resource 3",
  ];

  @override
  _ResourceTrackingFieldState createState() => _ResourceTrackingFieldState();
}

class _ResourceTrackingFieldState extends State<ResourceTrackingField> {
  // Function to remove an allocated resource
  void _removeResource(int index) {
    setState(() {
      widget.allocatedResources.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Resource Tracking"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                "Allocated Resources",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.allocatedResources.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.allocatedResources[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Remove the allocated resource when the delete icon is pressed
                          _removeResource(index);
                        },
                      ),
                      // Add more details or actions related to each allocated resource.
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
          // Implement logic to add new allocated resources
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Allocate Resource"),
                content: TextFormField(
                  decoration: InputDecoration(labelText: "Resource Name"),
                  onFieldSubmitted: (resourceName) {
                    if (resourceName.isNotEmpty) {
                      setState(() {
                        widget.allocatedResources.add(resourceName);
                      });
                      Navigator.of(context).pop();
                    }
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
                    child: Text("Allocate"),
                    onPressed: () {
                      // Handle allocation here if needed
                      Navigator.of(context).pop();
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
