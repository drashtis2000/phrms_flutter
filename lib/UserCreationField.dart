import 'package:flutter/material.dart';

class UserCreationField extends StatefulWidget {
  static const String id = "User-Creation-Field-Screen";

  @override
  _UserCreationFieldState createState() => _UserCreationFieldState();
}

class _UserCreationFieldState extends State<UserCreationField> {
  // Add necessary variables and controllers for user creation
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when not needed
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            Text("User Creation"),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildUserForm(),
              SizedBox(height: 20),
              _buildCreateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserForm() {
    return Column(
      children: [
        TextField(
          controller: usernameController,
          decoration: InputDecoration(labelText: "Username"),
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(labelText: "Email"),
        ),
        TextField(
          controller: passwordController,
          obscureText: true, // Hide the password
          decoration: InputDecoration(labelText: "Password"),
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to create a new user
        _createUser();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Create User"),
    );
  }

  void _createUser() {
    // Implement the logic to create a new user here
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    // You can now use 'username', 'email', and 'password' to create a new user.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("User Created"),
          content: Text("The user $username has been successfully created."),
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
