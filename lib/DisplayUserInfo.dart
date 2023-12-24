import 'package:flutter/material.dart';
import 'package:hw4/userModel.dart';

class DisplayUserInfo extends StatefulWidget {
  const DisplayUserInfo({super.key});


  @override
  State<DisplayUserInfo> createState() => _DisplayUserInfoState();
}

class _DisplayUserInfoState extends State<DisplayUserInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false, //remove default GO back button
        backgroundColor: Colors.black,
        title: const Text(
          "Display User Info",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back)),
      body: const Center(child: Text('User data'),)
    );
  }
}
