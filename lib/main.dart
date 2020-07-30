import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_screens/home.dart';
import 'package:flutter_app_screens/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  final _formKey = GlobalKey<FormState>();
  final _home = homescreen();
  final _fn = appFunction();

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue[00],
        centerTitle: true,
        title: Text(
        "Aware",
        style: TextStyle(color: Colors.yellow),
          ),
    ),
            body: Center(
                child: Form(
                  key: _formKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                          SizedBox(height: 20.0),
                            TextFormField(
                            decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter user id'
                          ),
                            validator: (value)
                            {
                              if (value.isEmpty) {  return "Please Enter your name";    }
                              { return null;   }
                              },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                          //border: InputBorder.none,
                          hintText: 'Enter password '),
                          validator: (value) {
                          if (value.isEmpty) {
                          return 'Please enter password';
                          }
                          else
                          return null;
                          },
                          ),
                          SizedBox(height: 20.0),
                          Padding(

                                //padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                    color: Colors.red,
                                    child: Text('Sign In',
                                        style: TextStyle(color: Colors.white)
                                    ),
                                    onPressed: () => {
                                      if( _formKey.currentState.validate())
                                        _fn.launchWebView(),
                                    }
                                ),
                          ),

                      ]
                  ),

              ),

          ),
      ),
      ),
    );
  }
}
