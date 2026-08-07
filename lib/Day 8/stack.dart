import 'package:flutter/material.dart';

class StackDay8 extends StatelessWidget {
  const StackDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack day 8'), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            clipBehavior: Clip.none,
            children: [
              Container(color: Colors.red, height: 400, width: 400),
              Container(color: Colors.blueAccent, height: 300, width: 300),
              Container(color: Colors.lightGreen, height: 200, width: 200),
              Container(color: Colors.blueGrey, height: 100, width: 100),
            ],
          ),
        ],
      ),
    );
  }
}
