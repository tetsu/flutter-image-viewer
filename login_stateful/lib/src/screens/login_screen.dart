import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            Container(margin: const EdgeInsets.only(top: 25.0)),
            passwordField(),
            Container(margin: const EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: (String? value) {
        if (value == null || !value.contains('@')) {
          return 'Please enter a valid email.';
        }
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: (String? value) {
        if (value == null || value.length < 4) {
          return 'Password must be at least 4 characters.';
        }
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue.shade50,
        foregroundColor: Colors.blue,
      ),
      child: const Text('Submit'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          print('Validated. Processing data.');
        }
      },
    );
  }
}
