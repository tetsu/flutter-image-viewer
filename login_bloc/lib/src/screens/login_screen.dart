import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: const EdgeInsets.only(top: 20.0)),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (BuildContext context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Address',
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (BuildContext context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.hasError ? snapshot.error.toString() : null,
            ),
          );
        });
  }

  Widget submitButton() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue.shade50,
        foregroundColor: Colors.blue,
      ),
      child: const Text('Login'),
      onPressed: () {},
    );
  }
}
