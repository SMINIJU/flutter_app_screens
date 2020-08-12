import 'dart:async';
import 'dart:convert';
import 'package:flutter_app_screens/Prin_notifer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_screens/STKRPTCARD.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



Future<Prin> fetchPrinc() async {
  Map Data;
  final response =
  await http.get("http://192.168.0.4:3000/api/PrincipalList");

//  print(json.decode(response.body));
//  print (response.body);
  if (response.statusCode == 200) {

     Data =json.decode(response.body);
     print(Data);
     return Prin.fromJson(Data);

  } else {

    throw Exception('Failed to load album');
  }
}

  class Prin {
  final String code;
  final String name;

  Prin({this.code, this.name});

  factory Prin.fromJson(Map<String, dynamic> json){
    return Prin(
      code: json['code'],
      name: json['name']

    );
  }
}
void main() => runApp(Princ());

class Princ extends StatefulWidget {
//  Princ({Key key}) : super(key: key);

  @override
  _PrincState createState() => _PrincState();
}

class _PrincState extends State<Princ> {
  Future<Prin> futurePrin;

//  setState(() {
// fetchPrinc();
//  });

  @override
  void initState() {
    super.initState();
    futurePrin = fetchPrinc();
  }

  @override
  Widget build(BuildContext context) {
    PrinNotifer prinNotifer = Provider.of<PrinNotifer>(context);
//    getData();
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
              child: ListView.separated(

                itemBuilder: (BuildContext context,int index) {
                  return ListTile(
                    title: Text(
                        prinNotifer.prinList[index].name.toString()),
                    subtitle: Text(prinNotifer.prinList[index].code.toString()),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return StockReport("002","gh");
                      }));
                    },
                  );
                },
                itemCount: prinNotifer.prinList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.black,),
              ),
            )),
      ),
    );
  }
}