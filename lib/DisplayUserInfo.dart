import 'package:flutter/material.dart';

class DisplayUserInfo extends StatelessWidget {
  const DisplayUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Display User Info", style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: Text("Display User Info"),
      ),
    );
  }
}
