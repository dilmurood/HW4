import 'package:flutter/material.dart';
import 'package:hw4/DisplayUserInfo.dart';
import 'package:hw4/GetUserInfo.dart';
import 'package:hw4/onBoard.dart';
import 'package:hw4/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;
void main() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  isViewed = pref.getInt('OnBoard');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isViewed != 0 ? const onBoard() : const GetUserInfo(),
      initialRoute: '/',
      routes: {
        '/GetUserInfo': (context) => const GetUserInfo(),
        '/DisplayUserInfo': (context) => DisplayUserInfo(),
        '/GetUserInfo': (context) => const GetUserInfo(),
      },
    );
  }
}
