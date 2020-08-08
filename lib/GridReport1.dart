import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String text;

  HeaderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(text),
      color: Colors.grey[200],
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Color color;
  BodyWidget(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
      alignment: Alignment.center,
    );
  }
}

class GridReport1 extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [

                ],
              ),
            ),
            SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              delegate: SliverChildListDelegate(
                [
                  BodyWidget(Colors.blue),
                  BodyWidget(Colors.green),
                  BodyWidget(Colors.yellow),
                  BodyWidget(Colors.orange),
                  BodyWidget(Colors.blue),
                  BodyWidget(Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
