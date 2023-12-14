import 'package:flutter/material.dart';
import 'package:hw4/DisplayUserInfo.dart';

class GetUserInfo extends StatelessWidget
{
  const GetUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Get User Info", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Get User Info"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayUserInfo()));
            }
            ))  );
  }
}