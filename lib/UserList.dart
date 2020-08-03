import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  Map data;
  List userData;


    Future getData() async {
      http.Response response =
      await http.get("http://192.168.0.4:3000/api/employees");
      userData = json.decode(response.body);

//    setState(() {
//      userData = data["data"];
//    });
     /// debugPrint(userData.toString());
    //  print(userData);
    }
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      home: Scaffold(
      body:Form(
        child: ListView.builder(

          itemCount:userData == null ? 0 : userData.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("${userData[index]["id"]} ${userData[index]["Username"]}"),
            );
          },

        ),
      ),
    ),
    );
  }
}