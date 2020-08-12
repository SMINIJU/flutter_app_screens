import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class StockReport extends StatefulWidget {
  final String code;
  final String name;
  StockReport(this.code,this.name );
   @override
  _StockReportState createState() => _StockReportState(code,name);
//

}

class _StockReportState extends State<StockReport> {
  final String code;
  final String name;
  _StockReportState(this.code,this.name);

  List userData;
    Future getData() async {
    http.Response response =
        await http.get("http://192.168.0.4:3000/api/EX_01_WREP_STKSUMM_01/" + code);
    userData = json.decode(response.body);
    //List<UserPrin> User =[];
    print(userData);
    setState(() {
      userData = userData;
    });
  }

  Widget build(BuildContext context) {
    getData();
    final StockReport args = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: BackButton(
            onPressed:()=> Navigator.pop(context),
            color: Colors.white,
          ),
          title: Text(name),

          centerTitle: true,
        ),
        body: Container(
            child: ListView.builder(
                itemCount: userData == null ? 0 : userData.length,
                itemBuilder: (BuildContext context, int index) {

                  return Builder(
                    builder: (context) => Center(
                      child: Card(
                          elevation: 5,
                        color: Colors.white,
                        // child:Column(
//                          children: <Widget>[
                        child: ListTile(

                          title: RichText(
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "${userData[index]["code"]}\n",
                                      style: TextStyle(fontSize: 20.0,color: Colors.black)),
                                  TextSpan(
                                      text: "${userData[index]["name"]}\n",
                                      style: TextStyle(fontSize: 18.0,color: Colors.black)),

                                  TextSpan(

                                      text:  "${userData[index]["model"]}\n",
                                      style: TextStyle(fontSize: 18.0,color: Colors.black)),
//



                                ]),
                          ),

                          subtitle: new Align(
                            child:Text("${userData[index]["uom"]}  ${userData[index]["avlstock"]}" ,
                                style: TextStyle(fontSize: 18.0,color: Colors.black,)),
                            alignment: Alignment.bottomRight,
                          )

//                             title: Text( " ${userData[index]["code"]}"),
//                              subtitle: Text(" ${userData[index]["name"]}"),
//
                        ),
//                        ]
                        //)
                      ),
                    ),
                  );
                })
        ),
      ),
    );
  }
}
