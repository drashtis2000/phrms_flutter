import 'package:flutter/material.dart';

bool isAdminAuthorized(BuildContext context) {
  // Replace this with your logic to fetch the user's role from Firestore or another source
  final userRole = 'admin'; // Example role

  if (userRole == 'admin') {
    return true; // Allow access
  } else {
    // Redirect to the unauthorized route or show an error message
    Navigator.pushReplacementNamed(context, '/unauthorized');
    return false; // Deny access
  }
}
