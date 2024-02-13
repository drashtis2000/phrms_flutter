import 'package:flutter/material.dart';

import 'UserActivityField.dart';
import 'UserCreationField.dart';
import 'UserPermissionsField.dart';
import 'UserRolesField.dart';

class UserItem {
  final String title;
  final String identifier;

  UserItem(this.title, this.identifier);
}

List<UserItem> userItems = [
  UserItem("User Creation", "user_creation"),
  UserItem("User Permissions", "user_permissions"),
  UserItem("User Roles", "user_roles"),
  UserItem("User Activity", "user_activity"),
];

class UserManagement extends StatelessWidget {
  static const String id = "User-Management-Screen";

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
            Text("User Management"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "User Creation",
                  description: "Description of User Creation...",
                  identifier: "user_creation",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "User Permissions",
                  description: "Description of User Permissions...",
                  identifier: "user_permissions",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "User Roles",
                  description: "Description of User Roles...",
                  identifier: "user_roles",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "User Activity",
                  description: "Description of User Activity...",
                  identifier: "user_activity",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldBox(BuildContext context, {required String title, required String description, required String identifier}) {
    return GestureDetector(
      onTap: () {
        if (identifier == "user_creation") {
          Navigator.pushNamed(context, UserCreationField.id);
        } else if (identifier == "user_permissions") {
          Navigator.pushNamed(context, UserPermissionsField.id);
        } else if (identifier == "user_roles") {
          Navigator.pushNamed(context, UserRolesField.id);
        } else if (identifier == "user_activity") {
          Navigator.pushNamed(context, UserActivityField.id);
        } else {
          // Handle other user management sub-modules' navigation
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Define your User Management sub-modules (UserCreationField, UserPermissionsField, UserRolesField, UserActivityField) similarly to the Resource Management modules.
