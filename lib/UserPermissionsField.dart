import 'package:flutter/material.dart';

class UserPermissionsField extends StatefulWidget {
  static const String id = "User-Permissions-Field-Screen";

  @override
  _UserPermissionsFieldState createState() => _UserPermissionsFieldState();
}

class _UserPermissionsFieldState extends State<UserPermissionsField> {
  // Add necessary variables and controllers for user permissions
  List<String> selectedPermissions = [];
  List<String> allPermissions = [
    "Read",
    "Write",
    "Edit",
    "Delete",
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
            Text("User Permissions"),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPermissionsList(),
            SizedBox(height: 20),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Permissions:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: allPermissions.map((permission) {
            return FilterChip(
              label: Text(permission),
              selected: selectedPermissions.contains(permission),
              onSelected: (isSelected) {
                _togglePermission(permission, isSelected);
              },
              selectedColor: Colors.red,
              backgroundColor: Colors.grey,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to save user permissions
        _saveUserPermissions();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Save Permissions"),
    );
  }

  void _togglePermission(String permission, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedPermissions.add(permission);
      } else {
        selectedPermissions.remove(permission);
      }
    });
  }

  void _saveUserPermissions() {
    // Implement the logic to save user permissions here
    // 'selectedPermissions' contains the selected permissions.

    // You can now use 'selectedPermissions' to update user permissions.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Permissions Saved"),
          content: Text("User permissions have been successfully saved."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
