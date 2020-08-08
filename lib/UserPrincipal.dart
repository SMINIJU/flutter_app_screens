import 'package:flutter/material.dart';
import 'package:flutter_app_screens/StockReport.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_screens/home.dart';
import 'package:flutter_app_screens/GridReport1.dart';

class UserPrin extends StatefulWidget {
  @override
  _UserPrinState createState() => _UserPrinState();

}

class _UserPrinState extends State<UserPrin> {
//  Map data;
  List userData;

  Future getData() async {
    http.Response response =
        await http.get("http://192.168.0.4:3000/api/PrincipalList");
    userData = json.decode(response.body);
  //List<UserPrin> User =[];
    setState(() {
      userData = userData;
    });

    /// debugPrint(userData.toString());
    print(userData);
  }

  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
          ),
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text(
            "Customer List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: userData == null ? 0 : userData.length,
                itemBuilder: (context, index) {
                  return Builder(
                      builder: (context) => Center(
                            child: ListTile(
                              title: Text(
                                  "${userData[index]["code"]} - ${userData[index]["name"]}"),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Stock();
                                }));
                              },
                            ),
                          ));
                },
              ),
            )),
      ),
    );
  }
}
