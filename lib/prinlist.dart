import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrinList extends StatefulWidget {
  @override
  _PrinListState createState() => _PrinListState();
}

class _PrinListState extends State<PrinList> {
  @override
  var Princode =[001,002,003];
  var Prinname = [
    'Cascade Realty Advisors Inc',
    'Parkway Company',
    'Fbs Business Finance'
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Principal List"),
        ),
        body: Form(
          child: ListView.builder(
            itemCount: Prinname.length,
            itemBuilder: (context, index) {
//              return Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Card(
//                  child: ListTile( title:Text(Prinname[index], style: TextStyle(fontSize: 20),
//                ),
//              ),
//                ),
//              );
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Princode')),
                  DataColumn(label: Text('PrinName')),

                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text("001")),
                    DataCell(Text("Das")),
                  ])
                ],


              ),
            );
            },
          ),
        ),
      ),
    );
  }
}
