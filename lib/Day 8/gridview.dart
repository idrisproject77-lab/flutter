import 'package:flutter/material.dart';

class GridviewDay8 extends StatelessWidget {
  const GridviewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.count(
        crossAxisCount: 10,
        mainAxisExtent: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          Container(color: Colors.red, height: 400, width: 400),
          Container(color: Colors.blueAccent, height: 300, width: 300),
          Container(color: Colors.lightGreen, height: 200, width: 200),
          Container(color: Colors.blueGrey, height: 100, width: 100),
          Container(color: Colors.deepOrangeAccent, height: 50, width: 50),
        ],
      ),
    );
  }
}
