// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors

import 'package:blood_donation_app/Home/Components/body.dart';
import 'package:blood_donation_app/Services/Authentication_services.dart';
import 'package:blood_donation_app/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isOpened = false;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                isOpened = !isOpened;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              setState(
                () {
                  AuthenticationService().signOut().then((value) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => AuthenticationWrapper(),
                      ),
                    );
                  });
                },
              );
            },
          ),
        ],
        title: isOpened
            ? Form(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(width: 1.0),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.rtl,
                    controller: searchController,
                    decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                      hintText: "بحث...",
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) => {
                      print(searchController.text),
                    },
                  ),
                ),
              )
            : null,
      ),
      body: Body(
        filter: searchController.text,
      ),
    );
  }
}
