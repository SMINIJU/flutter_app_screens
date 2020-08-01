import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PrinList extends StatefulWidget{
@override
_PrinListState createState() => _PrinListState();
}

class _PrinListState extends State<PrinList>{
  @override
  var Prinname  = ['Cascade Realty Advisors Inc',        'Parkway Company',        'Fbs Business Finance'];
  Widget build(BuildContext context)
  {
     return MaterialApp(
      home:Scaffold(
      body:Form(
      child: ListView.builder(
      itemCount: Prinname.length,
      itemBuilder: (context, index){
      return ListTile(
        title: Text(Prinname[index]
        ),
      );

    },
    ),
    ),
      ),
    );
  }
}