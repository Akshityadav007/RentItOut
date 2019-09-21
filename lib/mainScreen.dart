import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const id = 'MainScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                child: Text('Logout'),
                onPressed: () {
                  print('am pressed');
                },
              )
            ],
          ),
        ),
        drawer: null,
        bottomNavigationBar: null,
      ),
    );
  }
}
