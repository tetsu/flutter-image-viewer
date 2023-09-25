import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import './blocs/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Provider(
      key: const Key("App"),
      child: const MaterialApp(
        title: 'Log Me In',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
