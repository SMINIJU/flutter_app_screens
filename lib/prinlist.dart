import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PrinList extends StatefulWidget{
@override
_PrinListState createState() => _PrinListState();
}

class _PrinListState extends State<PrinList>{
  @override
  Widget build(BuildContext context)
  {
    var Prinname  =['Cascade Realty Advisors Inc'
        'Parkway Company'
        'Fbs Business Finance'];
    return ListView.builder(
      itemCount: Prinname.length,
      itemBuilder: (context, index){
      return ListTile(
        title: Text(Prinname[index]
        ),
      );

    },
    );
  }
}