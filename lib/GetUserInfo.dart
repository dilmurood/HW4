import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hw4/DisplayUserInfo.dart';

class GetUserInfo extends StatefulWidget {
  const GetUserInfo({super.key});

  @override
  GetUserInfoState createState() => GetUserInfoState();
}

class GetUserInfoState extends State<GetUserInfo> {
  int size = 100;
  List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Call the function to fetch data when the widget initializes
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
                      return ListTile(
                        leading: CircleAvatar(
                          //child: Icon(Icons.person)
                          backgroundImage: NetworkImage("${userData[index]['picture']['thumbnail']}")
                        
                        ),
                        dense: true,
                        title: Text(
                          "${'$index.'} ${userData[index]['name']['first']} ${userData[index]['name']['last']}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        subtitle: Text(
                          "${userData[index]['email']}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        trailing: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: const Icon(Icons.add),                        
                        ),
                      );
                    }),
              )
            ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                _getMoreUsers();
              },
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              child: const Text('Save'),
              onPressed: () {},
            ),
          ],
        ));
  }
}
