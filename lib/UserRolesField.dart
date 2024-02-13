import 'package:flutter/material.dart';

class UserRolesField extends StatefulWidget {
  static const String id = "User-Roles-Field-Screen";

  @override
  _UserRolesFieldState createState() => _UserRolesFieldState();
}

class _UserRolesFieldState extends State<UserRolesField> {
  // Add necessary variables and controllers for user roles
  List<String> selectedRoles = [];
  List<String> allRoles = [
    "Admin",
    "Editor",
    "Viewer",
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
            Text("User Roles"),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildRolesList(),
            SizedBox(height: 20),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildRolesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Roles:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: allRoles.map((role) {
            return FilterChip(
              label: Text(role),
              selected: selectedRoles.contains(role),
              onSelected: (isSelected) {
                _toggleRole(role, isSelected);
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
        // Implement logic to save user roles
        _saveUserRoles();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Save Roles"),
    );
  }

  void _toggleRole(String role, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedRoles.add(role);
      } else {
        selectedRoles.remove(role);
      }
    });
  }

  void _saveUserRoles() {
    // Implement the logic to save user roles here
    // 'selectedRoles' contains the selected roles.

    // You can now use 'selectedRoles' to update user roles.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Roles Saved"),
          content: Text("User roles have been successfully saved."),
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
