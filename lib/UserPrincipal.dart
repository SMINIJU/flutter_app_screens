import 'package:flutter/material.dart';
import 'package:flutter_app_screens/StockReport.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_screens/Prin_notifer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_screens/home.dart';
import 'package:flutter_app_screens/GridReport1.dart';
import 'package:flutter_app_screens/STKRPTCARD.dart';

class UserPrin extends StatefulWidget {
   @override
  _UserPrinState createState() => _UserPrinState();

}
class _UserPrinState extends State<UserPrin> {
  List userData;
//  Map Data;

  Future getData() async {
    http.Response response = await http.get("http://192.168.0.4:3000/api/PrincipalList");
    setState(() {
      userData;
    });
    if (response.statusCode == 200){
      return  userData = json.decode(response.body);
    }else{
    throw Exception('Failed to load data');
    }



    }
  Widget build(BuildContext context) {

    print(userData);
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
                itemCount: userData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Builder(
                      builder: (context) => Center(
                            child: ListTile(
                              title: Text(
                                  " ${userData[index]["name"]}"),
                              subtitle: Text("${userData[index]["code"]} "),
                              trailing: Icon(Icons.keyboard_arrow_right),

                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return StockReport( "${userData[index]["code"]} "," ${userData[index]["name"]}");
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

