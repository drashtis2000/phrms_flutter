import 'package:flutter/material.dart';

class ResourceInventoryField extends StatefulWidget {
  static const String id = "Resource-Inventory-Field";

  // Simulated list of resource items (replace with your data)
  final List<String> resourceItems = [
    "Resource Item 1",
    "Resource Item 2",
    "Resource Item 3",
  ];

  @override
  _ResourceInventoryFieldState createState() => _ResourceInventoryFieldState();
}

class _ResourceInventoryFieldState extends State<ResourceInventoryField> {
  // Function to remove a resource item
  void _removeResourceItem(int index) {
    setState(() {
      widget.resourceItems.removeAt(index);
    });
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
              SizedBox(width: 10), // Replace with the desired width
              Text("Resource Inventory"),
            ],
          )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                "Resource Inventory",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.resourceItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.resourceItems[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Remove the resource item when the delete icon is pressed
                          _removeResourceItem(index);
                        },
                      ),
                      // Add more details or actions related to each resource item.
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
          // Implement logic to add new resource items
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String newResourceItem = '';

              return AlertDialog(
                title: Text("New Resource Item"),
                content: TextFormField(
                  decoration: InputDecoration(labelText: "Resource Item"),
                  onChanged: (value) {
                    newResourceItem = value;
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
                      // Handle the submission of the new resource item here
                      if (newResourceItem.isNotEmpty) {
                        setState(() {
                          widget.resourceItems.add(newResourceItem);
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
