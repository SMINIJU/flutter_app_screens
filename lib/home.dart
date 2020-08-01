import 'package:flutter/material.dart';
import 'package:flutter_app_screens/prinlist.dart';

class Homescreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home :Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body:Form(
        child: Container(
          child:ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  children:<Widget>[
                    FlatButton(
                  onPressed: (){
                    return  PrinList();
                  },
                  child: Image.asset('Assets/Warehouse1.jpg')                ,
                  )
                    ]
                ),
              )
]          ),
        ),
    )
    )
    );
  }
}

