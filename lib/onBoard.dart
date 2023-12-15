// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class onBoard extends StatefulWidget {
  const onBoard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _onBoardState createState() {
    return _onBoardState();
  }
}

// ignore: camel_case_types
class _onBoardState extends State<onBoard> {
  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: const Text('welcome'),
          backgroundColor: Colors.blueAccent,
          actions: [
            TextButton(
              onPressed: () {
                _storeOnBoardInfo();
                Navigator.pushNamed(context, '/GetUserInfo');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
              Text(
                'Welcome to the app',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ])));
  }
}
