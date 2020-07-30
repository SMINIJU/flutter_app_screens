import 'package:flutter/material.dart';


class homescreen extends StatefulWidget {
/*
  final Function anotherscreen;
  homescreen({this.anotherscreen})*/
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Warehouse"),

      ),
      body:Form(
        child: Container(
          child: RaisedButton(
            child: Text("Back",
            style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      )

    );
  }
}
