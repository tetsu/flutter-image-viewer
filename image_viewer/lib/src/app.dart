// import flutter helper ibrary
import 'package:flutter/material.dart';

// create a class that will be our custom widget
// this class must extend the 'StatelesWidget' base class
class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('$counter'),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Let\'s see some widdgets'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
