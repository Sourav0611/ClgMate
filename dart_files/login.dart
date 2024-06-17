import 'package:flutter/material.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Define text controllers for username and password fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Define a form key to validate form inputs
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Method to handle form submission
  void _handleLogin() {
    // Validate the form inputs
    if (_formKey.currentState!.validate()) {
      // Perform login actions here (e.g., API call)
      // For this example, just print the username and password
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username text field
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                // Validator function to validate the input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Password text field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                // Mask the password input
                obscureText: true,
                // Validator function to validate the input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              // Login button
              ElevatedButton(
                onPressed: _handleLogin,
                child: Text('Login'),
              ),
              SizedBox(height: 12),
              // Register button
              TextButton(
                onPressed: () {
                  // Navigate to register page (you can replace with actual navigation code)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
