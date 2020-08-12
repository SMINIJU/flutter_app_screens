import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_screens/STKRPTCARD.dart';
import 'package:flutter_app_screens/StockReport.dart';
import 'package:flutter_app_screens/prinlist.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_screens/UserList.dart';
import 'package:flutter_app_screens/UserPrincipal.dart';
import 'package:flutter_app_screens/princlass.dart';

//class Homescreen extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: Scaffold(
//            appBar: AppBar(
//              title: Text("Menu"),
//            ),
//            body: Form(
//              child: Container(
//                child: ListView(shrinkWrap: true, children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Builder(
//                        builder: (context) => Center(
//                                child: FlatButton(
//                              onPressed: () => {
//                                Navigator.of(context).push(
//                                  MaterialPageRoute(
//                                    builder: (context) {
//                                      return UserPrin();
//                                    },
//                                  ),
//                                )
//                              },
//                              child: Image.asset('Assets/Warehouse1.jpg'),
//                            )
//                        )),
//                  )
//                ]),
//              ),
//            )

//        )
//    );
//  }
//}
class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
//  var MenuList = ['Stock Report', 'Transaction Report'];

//  final List<String>_listItem = [
//    "Assets/icon1.jpg",
//    " Assets/Warehouse1.jpg",
//    "Assets/transfer.jpg"
//  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
//            body: Row(
//              children: <Widget>[
//                 body: Column(
//
//                    children: <Widget>[
//
//                      new RaisedButton(
//
//                        onPressed: () =>
//                        {
//                          Navigator.of(context).push(
//                            MaterialPageRoute(
//                              builder: (context) {
//                                return UserPrin();
//                              },
//                            ),
//                          )
//                        },
//                        child: Image.asset('Assets/Warehouse1.jpg'),
//
//                      ),
//
//
//                      Padding(
//                        padding: const EdgeInsets.all(16.0),
//                        child: new RaisedButton(
//                          onPressed:  () => {
//                                      Navigator.of(context).push(
//                                        MaterialPageRoute(
//                                          builder: (context) {
//                                            return Stock();
//                                          },
//                                        ),
//                                      )
//                                    },
//                                    child: Image.asset('Assets/transfer.jpg'),
//
//                        ),
//                      ),
//                    ],
//                  ),
//              //],
//            ),
//            );

      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          Container(
            child: InkWell(
              child: Text(
                "GRN REPORT",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return UserPrin();
                    },
                  ),
                );
              },
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/stock.png'), fit: BoxFit.cover)),
          ),
          Container(
            child: InkWell(
              child: Text(
                "STOCK REPORT",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return UserPrin();
                    },
                  ),
                );
              },
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/GRN.jpg'), fit: BoxFit.cover)),
          ),
          Container(
            child: InkWell(
              child: Text(
                "TRANSACTION REPORT",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Princ();
                    },
                  ),
                );
              },
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('Assets/Trans.png'), fit: BoxFit.cover)),
          ),
        ],
      ),

//          body: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Container(
//                child: ListView.builder(
//                  itemCount: MenuList == null ? 0 : MenuList.length,
//                  itemBuilder: (context, index) {
//                    return Builder(
//                        builder: (context) => Center(
//                          child: ListTile(
//                            title: Text(MenuList[index]),
//                            trailing: Icon(Icons.keyboard_arrow_right),
//                            onTap: () {
//                              Navigator.of(context)
//                                  .push(MaterialPageRoute(builder: (context) {
//                                return UserPrin();
//                              }));
//                            },
//                          ),
//                        ));
//                  },
//                ),
//              )),
    ));
  }
}
