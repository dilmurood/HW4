import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hw4/DisplayUserInfo.dart';
import 'package:hw4/userModel.dart';

import 'CustomWidgets/CustomListTile.dart';

class GetUserInfo extends StatefulWidget {
  const GetUserInfo({super.key});

  @override
  GetUserInfoState createState() => GetUserInfoState();
}

class GetUserInfoState extends State<GetUserInfo> {
  int size = 100;
  List<dynamic> userData = [];
  Set<dynamic> selectedItems = Set<dynamic>();

  late AnimationController _controller;
  Route _createRoutes() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const DisplayUserInfo(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void fetchData() async {
    try {
      var url = 'https://randomuser.me/api/?results=1000';
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          userData = json.decode(response.body)['results'];
        });
      } else {
        print('Failed to get data.');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void _getMoreUsers() {
    setState(() {
      size += 50;
      if (size >= 1000) size = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text(
            "Get User Info",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: size,
                    itemBuilder: (BuildContext context, int index) {
                      var data = userData[index];
                      return CustomListTile(
                          data: data,
                          index: index,
                          isSelected: selectedItems.contains(index),
                          onTap: (bool isSelected) {
                            setState(() {
                              if (isSelected) {
                                selectedItems.add(index); // Add to selection
                              } else {
                                selectedItems
                                    .remove(index); // Remove from selection
                              }
                            });
                          });
                    }),
              )
            ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                _getMoreUsers();
              },
              backgroundColor: Colors.lightGreen,
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),            
            FloatingActionButton(
              onPressed: () async {
                if (selectedItems.isNotEmpty) {
                  List<User> selectedUsers = [];
                  for (int index in selectedItems) {
                    var data = userData[index];                    
                    selectedUsers.add(data);
                  }
                }
              },
              backgroundColor: Colors.lightGreen,
              child: const Text('Save'),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(_createRoutes());
              },
              backgroundColor: Colors.lightGreen,
              child: const Text('Next'),
            ),
          ],
        ));
  }
}
