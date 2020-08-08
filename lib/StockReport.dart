import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_screens/home.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
  final String code;
  final String name;

  Stock({this.code, this.name});
}

class _StockState extends State<Stock> {
//  Map data;
  List userData;

  Future getData() async {
    http.Response response =
        await http.get("http://192.168.0.4:3000/api/EX_01_WREP_STKSUMM_01");
    userData = json.decode(response.body);

    setState(() {
      userData = userData;
    });
    print(userData.length);

//    debugPrint(userData.toString());
//    print(userData);
  }

  Widget bodyData() => DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                "Product code ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Text(
                "Product name ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Text(
                "Uom ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Text(
                "Stock",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Text(
                "Avlstock",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              numeric: false,
            ),
          ],
          rows: userData
              .map((name) => DataRow(cells: [
                    DataCell(
                      Container(
                          width: 150,
                          child: Text(
                            name["code"],
                            style: TextStyle(fontSize: 15,),
                          )),
                    ),
                    DataCell(
                      Container(
                          width: 170,

                          child: Text(
                            name["name"],
                            style: TextStyle(fontSize: 15),
                          )),
                    ),
                    DataCell(
                      Text(
                        name["uom"],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    DataCell(
                      Text(
                        name["stock"].toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    DataCell(
                      Text(
                        name["avlstock"].toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ]))
              .toList());

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
            "Stock Report",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: bodyData(),
            ),
          ),

          /*   body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(

        child:bodyData()
          child: ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
            itemBuilder: (context, index) {
              return Table(
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    TableRow(children: [
                      Text("PrinCode", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("PrinNAME", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("UOM", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("Stock", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),),
                      Text("AvlStock", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),)

                    ]),


                    TableRow(children: [


                      Text("${userData[index]["code"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),),
                      Text("${userData[index]["name"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),),
                      Text("${userData[index]["uom"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),),
                      Text("${userData[index]["stock"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),),
                      Text("${userData[index]["avlstock"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),)
                    ]),

                  ]);

//                  ListTile(
//                    title: Text("${userData[index]["code"]} - ${userData[index]["name"]}"),
//                  );
            },


          ),
        )
    )),
*/
        ),
      ),
    );
  }
}
